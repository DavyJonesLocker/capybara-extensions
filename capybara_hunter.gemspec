# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capybara_hunter/version'

Gem::Specification.new do |spec|
  spec.name          = "capybara_hunter"
  spec.version       = CapybaraHunter::VERSION
  spec.authors       = ["Michael Dupuis Jr."]
  spec.email         = ["michael.dupuis@dockyard.com"]
  spec.description   = %q{Additional finders for Capybara.}
  spec.summary       = %q{Additional finders for Capybara.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
