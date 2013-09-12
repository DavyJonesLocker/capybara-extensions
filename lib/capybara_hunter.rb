require 'capybara'

module CapybaraHunter
  FinderMethods = []
end

require 'capybara_hunter/finders'

module Capybara::DSL
  CapybaraHunter::FinderMethods.each do |method|
    define_method method do |*args, &block|
      page.send method, *args, &block
    end
  end
end

class Capybara::Session
  CapybaraHunter::FinderMethods.each do |method|
    define_method method do |*args, &block|
      current_scope.send method, *args, &block
    end
  end
end

Capybara::Node::Base.send(:include, CapybaraHunter::Finders)
Capybara::Node::Simple.send(:include, CapybaraHunter::Finders)
