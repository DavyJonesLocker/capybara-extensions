require 'capybara'

module CapybaraExtensions
  FinderMethods = []
end

require 'capybara_extensions/finders'

module CapybaraExtensions
  MatcherMethods = []
end
require 'capybara_extensions/matchers'

module Capybara::DSL
  CapybaraExtensions::FinderMethods.each do |method|
    define_method method do |*args, &block|
      page.send method, *args, &block
    end
  end
end

class Capybara::Session
  CapybaraExtensions::FinderMethods.each do |method|
    define_method method do |*args, &block|
      current_scope.send method, *args, &block
    end
  end
end

Capybara::Node::Base.send(:include, CapybaraExtensions::Finders)
Capybara::Node::Simple.send(:include, CapybaraExtensions::Finders)
