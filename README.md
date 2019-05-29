# Itamae::Recipe::Seasoning

a patch to add seasonings to itamae recipes

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-recipe-seasoning'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-recipe-seasoning

## Usage

if you have a recipe for steak which accepts seasonings of your choice with a method call 'include_seasoning' like below,

* steak.rb
```
include_recipe 'put_oil_in_the_pan'
include_recipe 'put_a_steak'
include_recipe 'bake_it'

include_seasoning

include_recipe 'serve_it_on_the_plate'
```

First, enable seasoning patch at the top of your recipe.

```
require 'itamae/recipe/seasoning'
```

Then, you can add your own seasonigs into to the recipe!

```
include_recipe 'steak' do
  include_recipe 'salt_and_pepper'
end
```

## Recipes which can be arranged by extra seasonings

* https://github.com/maedadev/itamae-plugin-recipe-god
* https://github.com/maedadev/itamae-plugin-recipe-supervisor

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/itamae-recipe-seasoning. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Itamae::Recipe::Seasoning project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/itamae-recipe-seasoning/blob/master/CODE_OF_CONDUCT.md).
