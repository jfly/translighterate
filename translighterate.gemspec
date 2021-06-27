# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "translighterate/version"

Gem::Specification.new do |spec|
  spec.name          = "translighterate"
  spec.version       = Translighterate::VERSION
  spec.authors       = ["Jeremy Fleischman"]
  spec.email         = ["jeremyfleischman@gmail.com"]

  spec.summary       = "A version of Rails's highlight that is transliteration aware."
  spec.description   = "For example, highlighting 'duss' in 'Düsseldorf' will actually match something."
  spec.homepage      = "https://github.com/jfly/translighterate"

  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "actionview", ">= 4.0"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug", "~> 9.0"
end
