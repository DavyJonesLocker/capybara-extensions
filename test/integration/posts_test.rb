require 'test_helper'

class PostsTest < ActionDispatch::IntegrationTest
  describe 'posts#index' do
    let(:post) { posts(:one) }

    before do
      visit posts_path
    end

    it 'finds posts table' do
      find_table 'Title of first post'
    end

    it 'finds second post row' do
      find_row 'Body of second post'
    end

    it "passes if has_field_value returns true" do
      visit edit_post_path(post)
      byebug
      page.has_field_value?('title', with: 'Title of first post')
    end

    # TODO: Decide if we really want to overwite the capybara matcher
    # it 'finds image of John Doe' do
      # # page.has_link?(src: 'http://example.com/johndoe').must_equal false
      # # page.wont_have_link(src: 'http://example.com/johndoe')

      # page.has_image?(src: 'http://example.com/johndoe').must_equal true
      # page.has_image?(src: 'http://example.com/johndoe').must_equal true

      # # page.must_have_image(src: 'http://example.com/johndoe')
      # # page.wont_have_image(src: 'http://example.com/johndoh')
    # end
  end
end
