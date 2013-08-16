require 'byebug'
require 'capybara'
require 'capybara_minitest_spec'
require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

class Animal
  attr_accessor :id, :name
  def initialize(id, name)
    @id = id
    @name = name
  end
end
