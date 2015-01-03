# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'app_registry/version'

Gem::Specification.new do |spec|
  spec.name          = "app_registry"
  spec.version       = AppRegistry::VERSION
  spec.authors       = ["uno4ki"]
  spec.email         = ["i.have@no.mail"]
  spec.description   = %q{Simple gem for works with persistent variables}
  spec.summary       = %q{Persistent variables storage for rails app}
  spec.homepage      = "https://github.com/the-furnish/app_registry"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.3"

  spec.add_dependency 'activerecord', '>= 4.0'
end
