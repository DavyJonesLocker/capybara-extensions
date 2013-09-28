require 'test_helper'

class PostsTest < ActionDispatch::IntegrationTest
  describe 'posts#index' do
    before do
      visit posts_path
      byebug
    end

    it 'finds posts table' do
      find_table 'The first post title'
    end

    it 'finds second post row' do
      find_row 'Donec iaculis ultricies orci id consequat.'
    end

    it 'finds image of John Doe' do
      page.has_image?(src: 'http://example.com/johndoe').must_equal true
      #page.must_have_image(src: 'http://example.com/johndoe')
    end
  end
end
