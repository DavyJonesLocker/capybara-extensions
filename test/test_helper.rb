ENV['RAILS_ENV'] = 'test'
require File.expand_path('../dummy/config/environment.rb',  __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'byebug'
require 'capybara/rails'
require 'capybara_extensions'
require 'minitest/autorun'
require 'minitest/reporters'

# string to test against
require 'string'


MiniTest::Reporters.use!

class Post
  attr_accessor :id, :title, :body, :author
  def initialize(id)
    @id = id
  end
end

class MiniTest::Spec
  class << self
    alias :context :describe
  end
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
end
