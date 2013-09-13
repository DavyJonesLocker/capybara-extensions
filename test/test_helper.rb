require 'byebug'
require 'capybara'
require 'capybara_minitest_spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'string'

MiniTest::Reporters.use!

class Post
  attr_accessor :id, :title, :body, :author
  def initialize(id, title, body, author)
    @id = id
    @title = title
    @body = body
    @author = author
  end
end

class Guideline
  attr_accessor :id, :text
  def initialize(id, text)
    @id = id
    @text = text
  end
end
