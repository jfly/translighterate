# translighterate = transliterate + highlight

(Created after getting no responses to this [Stack Overflow question](http://stackoverflow.com/questions/34166987/rails-gem-for-transliterate-highlight).)

This is a version of Rails's [highlight](http://apidock.com/rails/ActionView/Helpers/TextHelper/highlight) that is transliteration aware.

For example, highlighting 'duss' in 'Düsseldorf' will actually match something.

## Building
- `gem build translighterate.gemspec`

## Publishing to Rubygems
- `gem push translighterate-X.Y.Z.gem`
