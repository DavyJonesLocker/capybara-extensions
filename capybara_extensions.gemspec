# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capybara_extensions/version'

Gem::Specification.new do |spec|
  spec.name          = "capybara_extensions"
  spec.version       = CapybaraExtensions::VERSION
  spec.authors       = ["Michael Dupuis Jr.", 'Dan McClain']
  spec.email         = ["michael.dupuis@dockyard.com", 'rubygems@danmcclain.net']
  spec.description   = %q{Additional finders for Capybara.}
  spec.summary       = %q{Additional finders for Capybara.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'capybara', '~> 2.1.0'
  spec.add_development_dependency 'capybara_minitest_spec'
  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'minitest', '< 5.0'
  spec.add_development_dependency 'minitest-reporters', '~> 0.14.21'
  spec.add_development_dependency 'minitest-rails'
  spec.add_development_dependency 'm'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'sqlite3'

  spec.add_development_dependency 'builder'
  spec.add_development_dependency 'rails', '~> 4.0.0'
end
