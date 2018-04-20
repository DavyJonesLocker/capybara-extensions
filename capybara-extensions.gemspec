# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capybara-extensions/version'

Gem::Specification.new do |spec|
  spec.name          = "capybara-extensions"
  spec.version       = CapybaraExtensions::VERSION
  spec.authors       = ["Michael Dupuis Jr.", 'Dan McClain']
  spec.email         = ["michael.dupuis@dockyard.com", 'rubygems@danmcclain.net']
  spec.description   = %q{Complements Capybara with additional finders and matchers.}
  spec.summary       = %q{Capybara has an intuitive API which mimics the language of an actual user. This library extends Capybara's finders and matchers with additional methods for interacting with tables, lists, and list items, as well as many HTML5 elements.}
  spec.homepage      = "https://github.com/dockyard/capybara-extensions"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'builder'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'capybara_minitest_spec'
  spec.add_development_dependency 'm', '~> 1.3.2'
  spec.add_development_dependency 'minitest', '< 5.0'
  spec.add_development_dependency 'minitest-reporters', '~> 0.14.21'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'yard'

  spec.add_runtime_dependency 'capybara', '>= 2.2'
end
