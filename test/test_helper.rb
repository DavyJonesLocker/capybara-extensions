require 'byebug'
require 'capybara-extensions'
require 'minitest/autorun'
require 'minitest/reporters'

# string to test against
require 'string'

MiniTest::Reporters.use!

class MiniTest::Spec
  class << self
    alias :context :describe
  end
end

module MiniTest::Expectations
  infect_an_assertion :assert_received, :must_have_received
end

class Post
  attr_accessor :id
  def initialize(id)
    @id = id
  end
end
