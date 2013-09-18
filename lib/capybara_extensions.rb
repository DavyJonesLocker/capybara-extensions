require 'capybara'

module CapybaraExtensions
  ExtensionMethods = []
end

require 'capybara_extensions/finders'
require 'capybara_extensions/matchers'

module Capybara::DSL
  CapybaraExtensions::ExtensionMethods.each do |method|
    define_method method do |*args, &block|
      page.send method, *args, &block
    end
  end
end

class Capybara::Session
  CapybaraExtensions::ExtensionMethods.each do |method|
    define_method method do |*args, &block|
      current_scope.send method, *args, &block
    end
  end
end

Capybara::Node::Base.send(:include, CapybaraExtensions::Finders)
Capybara::Node::Base.send(:include, CapybaraExtensions::Matchers)
Capybara::Node::Simple.send(:include, CapybaraExtensions::Finders)
Capybara::Node::Simple.send(:include, CapybaraExtensions::Matchers)
