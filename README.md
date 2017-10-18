# translighterate = transliterate + highlight [![Build Status](https://travis-ci.org/jfly/translighterate.svg?branch=master)](https://travis-ci.org/jfly/translighterate)

(Created after getting no responses to this [Stack Overflow question](http://stackoverflow.com/questions/34166987/rails-gem-for-transliterate-highlight).)

This is a version of Rails's [highlight](http://apidock.com/rails/ActionView/Helpers/TextHelper/highlight) that is transliteration aware.

For example, highlighting 'duss' in 'Düsseldorf' will actually match something:

```ruby
irb(main):001:0> require 'translighterate'
=> true
irb(main):002:0> Translighterate.highlight("Düsseldorf", "duss")
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

## Building
- `gem build translighterate.gemspec`

## Testing
- `bin/rspec`

## Publishing to Rubygems
- `gem push translighterate-X.Y.Z.gem`
