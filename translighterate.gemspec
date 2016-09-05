Gem::Specification.new do |s|
  s.name = 'translighterate'
  s.version = '0.0.3'
  s.date = '2016-09-04'
  s.summary = "A version of Rails's highlight that is transliteration aware."
  s.description = "For example, highlighting 'duss' in 'Düsseldorf' will actually match something."
  s.authors = ["Jeremy Fleischman"]
  s.email = 'jeremyfleischman@gmail.com'
  s.files = ["lib/translighterate.rb"]
  s.homepage = 'https://github.com/jfly/translighterate'
  s.license = 'MIT'

  s.add_dependency "actionview", "~> 4.2"

  s.add_development_dependency "rspec", "~> 3.5"
  s.add_development_dependency "byebug", "~> 9.0"
  s.add_development_dependency "rake", "~> 11.2"
end
