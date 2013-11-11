require 'capybara'
require 'capybara_minitest_spec'

module CapybaraExtensions
  def self.extension_methods
    (CapybaraExtensions::Finders.instance_methods + CapybaraExtensions::Matchers.instance_methods - Object.instance_methods).uniq
  end
end

require 'capybara-extensions/finders'
require 'capybara-extensions/matchers'

module Capybara::DSL
  CapybaraExtensions.extension_methods.each do |method|
    define_method method do |*args, &block|
      page.send method, *args, &block
    end
  end
end

class Capybara::Session
  CapybaraExtensions::extension_methods.each do |method|
    define_method method do |*args, &block|
      current_scope.send method, *args, &block
    end
  end
end

Capybara::Node::Base.send(:include, CapybaraExtensions::Finders)
Capybara::Node::Base.send(:include, CapybaraExtensions::Matchers)
Capybara::Node::Simple.send(:include, CapybaraExtensions::Matchers)
Capybara::Node::Simple.send(:include, CapybaraExtensions::Finders)
