require 'test_helper'
require 'capybara_hunter'

describe '.string' do
  let(:guideline) { Guideline.new(1, 'Write well') }
  let(:post) { Post.new(3, 'The third post title', 'Sed id tortor odio. Proin a adipiscing quam. Donec posuere condimentum dolor, mollis consectetur diam consectetur eu. Etiam ipsum augue, imperdiet ac porttitor tristique, hendrerit.', 'John Doe') }
  let(:string) { Capybara.string TestString }
  let(:unique) { 'John Doe' }
  let(:multi_in_table) { 'Jane Doe' }

  describe '#list_item' do
    it 'finds the list item when passed a unique string' do
      string.list_item('well').text.must_have_content 'Write well'
    end

    it 'finds the list item when passed an instance object' do
      string.list_item(post).text.must_have_content 'The third post title'
    end
  end

  describe '#ordered_list' do
    it 'finds the ordered list when passed a unique string matching a line item' do
      string.ordered_list('first').text.must_have_content 'The first post title'
    end

    it 'finds the ordered list when passed an object matching a line item' do
      string.ordered_list(post).text.must_have_content 'The second post title'
    end
  end

  describe '#unordered_list' do
    it 'finds the unordered list when passed a unique string matching a line item' do
      string.unordered_list('well').text.must_have_content 'Write well'
    end

    it 'finds the unordered list when passed an object matching a line item' do
      string.unordered_list(guideline).text.must_have_content 'Write well'
    end
  end

  describe '#find_row' do
    it 'finds a row when passed a unique string' do
      string.find_row(unique).text.must_have_content unique
      string.find_row(unique).text.wont_have_content multi_in_table
    end

    it 'finds a row when passed an instance object' do
      string.find_row(post).text.must_have_content unique
    end
  end

  describe '#find_table' do
    it 'finds a table when passed a unique string' do
      string.find_table(unique).text.must_have_content unique
      string.find_table(unique).text.wont_have_content multi_in_table
    end

    it 'finds a table when pass a string that occurs multiple times with the table' do
      string.find_table(multi_in_table).text.must_have_content multi_in_table
      string.find_table(multi_in_table).text.wont_have_content unique
    end

    it 'finds a row when passed an instance object' do
      string.find_table(post).text.must_have_content unique
    end
  end

  describe '#list_item_number' do
    it 'return the list item of the number passed in' do
      string.unordered_list('Write well').list_item_number(2).must_have_content 'Write frequently'
      string.ordered_list('The first post title').list_item_number(2).must_have_content 'The third post title'
    end
  end

  describe '#row_number' do
    it 'returns the row of the number passed in' do
      string.find_table('Jane Doe').row_number(1).text.must_have_content 'The first post title'
      string.find_table('Jane Doe').row_number(2).text.must_have_content 'The second post title'
    end
  end

  # items ordered using li_number or row_number
  # paragraph
  # nav (ul)?
end
