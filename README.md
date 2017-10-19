# translighterate = transliterate + highlight [![Build Status](https://travis-ci.org/jfly/translighterate.svg?branch=master)](https://travis-ci.org/jfly/translighterate)

(Created after getting no responses to this [Stack Overflow question](http://stackoverflow.com/questions/34166987/rails-gem-for-transliterate-highlight).)

This is a version of Rails's [highlight](http://apidock.com/rails/ActionView/Helpers/TextHelper/highlight) that is transliteration aware.

For example, highlighting 'duss' in 'Düsseldorf' will actually match something:

```ruby
irb(main):001:0> require 'translighterate'
=> true
irb(main):002:0> Translighterate::highlight("Düsseldorf", "duss")
=> "<mark>Düss</mark>eldorf"
```

as opposed to this behavior with Rails's [highlight](http://apidock.com/rails/ActionView/Helpers/TextHelper/highlight):

```ruby
irb(main):002:0> require 'action_view'
=> true
irb(main):004:0> include ActionView::Helpers::TextHelper
=> Object
irb(main):005:0> highlight("Düsseldorf", "duss")
=> "Düsseldorf"
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'translighterate'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install translighterate

## Usage

We have one class `Translighterate` with one method `highlight`.

```ruby
irb(main):001:0> require 'translighterate'
=> true
irb(main):002:0> Translighterate::highlight("Düsseldorf", "duss")
=> "<mark>Düss</mark>eldorf"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Testing

`bin/rspec` to run the tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jfly/translighterate.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
