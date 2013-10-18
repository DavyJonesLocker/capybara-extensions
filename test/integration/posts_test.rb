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
      page.has_field_value?('Title', of: 'Title of first post')
    end
  end
end
