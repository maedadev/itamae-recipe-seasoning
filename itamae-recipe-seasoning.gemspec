lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "itamae/recipe/seasoning/version"

Gem::Specification.new do |spec|
  spec.name          = "itamae-recipe-seasoning"
  spec.version       = Itamae::Recipe::Seasoning::VERSION
  spec.authors       = ["ichy"]
  spec.email         = ["ichylinux@gmail.com"]

  spec.summary       = %q{a patch to add seasonings to itamae recipes}
  spec.description   = %q{a patch to add seasonings to itamae recipes}
  spec.homepage      = "https://github.com/ichylinux/itamae-recipe-seasoning"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'itamae', '~> 1.10', '>= 1.10.4'

  spec.add_development_dependency "bundler", ">= 1.17.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
