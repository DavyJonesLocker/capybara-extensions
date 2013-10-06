ENV['RAILS_ENV'] = 'test'
require File.expand_path('../dummy/config/environment.rb',  __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'byebug'
require 'capybara/rails'
require 'capybara_extensions'
require 'minitest/autorun'
require 'minitest/reporters'
require 'database_cleaner'

# string to test against
require 'string'


MiniTest::Reporters.use!

class MiniTest::Spec
  class << self
    alias :context :describe
  end
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  teardown do
    DatabaseCleaner.clean
    Capybara.reset_sessions!
  end
end

class Post < ActiveRecord::Base; end

class ActiveSupport::TestCase
  fixtures :all
end
