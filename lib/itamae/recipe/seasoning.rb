require 'itamae'

module Itamae
  class Recipe
    attr_reader :parent_recipe
    attr_reader :seasoning
    attr_accessor :original_recipe

    def load_with_seasoning(vars = {}, parent_recipe = nil, seasoning = nil)
      if seasoning
        @parent_recipe = parent_recipe
        @parent_recipe.original_recipe = self
        @seasoning = seasoning
      end
      context = EvalContext.new(self, vars)
      InstanceEval.new(File.read(path), path, 1, context: context).call
    end
    alias_method :load_without_seasoning, :load
    alias_method :load, :load_with_seasoning
    
    class EvalContext

      def include_seasoning
        if @recipe.seasoning
          context = EvalContext.new(@recipe.parent_recipe, {})
          context.instance_eval(&@recipe.seasoning)
        end
      end

      def include_recipe_with_seasoning(target, &block)
        expanded_path = ::File.expand_path(target, File.dirname(@recipe.path))
        expanded_path = ::File.join(expanded_path, 'default.rb') if ::Dir.exist?(expanded_path)
        expanded_path.concat('.rb') unless expanded_path.end_with?('.rb')
        candidate_paths = [expanded_path, Recipe.find_recipe_in_gem(target)].compact
        path = candidate_paths.find {|path| File.exist?(path) }

        unless path
          raise NotFoundError, "Recipe not found. (#{target})"
        end

        if runner.children.find_recipe_by_path(path)
          Itamae.logger.debug "Recipe, #{path}, is skipped because it is already included"
          return
        end

        recipe = Recipe.new(runner, path)

        if @recipe.original_recipe
          @recipe.original_recipe.children << recipe
        else
          @recipe.children << recipe
        end

        if block_given?
          recipe.load({}, @recipe, Proc.new(&block))
        else
          recipe.load({})
        end
      end
      alias_method :include_recipe_without_seasoning, :include_recipe
      alias_method :include_recipe, :include_recipe_with_seasoning

    end
  end
end
