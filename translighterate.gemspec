Gem::Specification.new do |s|
  s.name = 'translighterate'
  s.version = '0.1.0'
  s.date = '2017-10-18'
  s.summary = "A version of Rails's highlight that is transliteration aware."
  s.description = "For example, highlighting 'duss' in 'Düsseldorf' will actually match something."
  s.authors = ["Jeremy Fleischman"]
  s.email = 'jeremyfleischman@gmail.com'
  s.files = ["lib/translighterate.rb"]
  s.homepage = 'https://github.com/jfly/translighterate'
  s.license = 'MIT'

  s.add_dependency "actionview", ">= 4.0", "< 6.0"

  s.add_development_dependency "rspec", "~> 3.5"
  s.add_development_dependency "byebug", "~> 9.0"
  s.add_development_dependency "rake", "~> 11.2"
end
