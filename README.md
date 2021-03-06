# Cheezme

Cheezme is a CLI app that returns a list of Macaroni and Cheese recipes from Allrecipes.com. We can inspect each recipe for a list of ingredients, the time to cook and prepare, reviews, and the user that submitted it.
You will be presented with a list of recipes. Choose the number of the recipe that you'd like to get directions for. Type `list` to display the choices again, and `exit` to terminate.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cheezme'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cheezme

## Usage

To run Cheezme (I *know*), run `bin/cheezme` from the project directory. The app will return a list of recipes from the Macaroni and Cheese category page of Allrecipes.com.  

When presented with the list, choose a recipe to get more information. To display the whole list again, type `list`, and type exit when you're done browsing.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/big32mike/cheezme. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cheezme project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/big32mike/cheezme/blob/master/CODE_OF_CONDUCT.md).
