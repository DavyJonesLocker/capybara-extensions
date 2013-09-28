require 'test_helper'

class PostsTest < ActionDispatch::IntegrationTest
  describe 'posts#index' do
    let(:john) { posts(:one) }

    before do
      visit posts_path
    end

    it 'finds posts table' do
      find_table 'Title of first post'
    end

    it 'finds second post row' do
      find_row 'Body of second post'
    end

    it 'finds image of John Doe' do
      page.has_image?(src: 'http://example.com/johndoe').must_equal true
      #page.must_have_image(src: 'http://example.com/johndoe')
    end
  end
end
