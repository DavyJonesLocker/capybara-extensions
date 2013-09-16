require 'test_helper'
require 'capybara_hunter'

describe '.string' do
  let(:guideline) { Guideline.new(1, 'Write well') }
  #let(:post) { Post.new(3, 'The third post title', 'Sed id tortor odio. Proin a adipiscing quam. Donec posuere condimentum dolor, mollis consectetur diam consectetur eu. Etiam ipsum augue, imperdiet ac porttitor tristique, hendrerit.', 'John Doe') }
  let(:post) { Post.new(3) }
  let(:string) { Capybara.string TestString }
  let(:unique) { 'John Doe' }
  let(:multiple) { 'Jane Doe' }

  # article
  #
  describe '#find_article' do
    it 'finds the article when passed a unique string' do
      string.find_article('John Doe').text.must_have_content 'John Doe'
      string.find_article('John Doe').text.wont_have_content 'Jane Doe'
      string.article('John Doe').text.must_have_content 'John Doe'
      string.article('John Doe').text.wont_have_content 'Jane Doe'
    end

    it 'finds the article when passed an instance' do
      string.find_article(post).text.must_have_content 'John Doe'
      string.find_article(post).text.wont_have_content 'Jane Doe'
      string.article(post).text.must_have_content 'John Doe'
      string.article(post).text.wont_have_content 'Jane Doe'
    end
  end

  describe '#first_article' do
    it 'finds the first article when passed a string' do
      string.first_article(multiple).text.must_have_content multiple
      string.first_article(multiple).text.wont_have_content unique
    end

    it 'finds the first article when passed an instance' do
      string.first_article(Post.new(2)).text.must_have_content 'This is another article for Jane Doe'
      string.first_article(Post.new(2)).text.wont_have_content 'This is an article for Jane Doe'
    end
  end

  # li
  #
  describe '#list_item' do
    it 'finds the list item when passed a unique string' do
      string.list_item('well').text.must_have_content 'Write well'
    end

    it 'finds the list item when passed an instance object' do
      string.list_item(post).text.must_have_content 'The third post title'
    end
  end

  describe '#list_item_number' do
    it 'return the list item of the number passed in' do
      string.unordered_list('Write well').list_item_number(2).must_have_content 'Write frequently'
      string.ordered_list('The first post title').list_item_number(2).must_have_content 'The third post title'
    end
  end

  # ol
  #
  describe '#ordered_list' do
    it 'finds the ordered list when passed a unique string matching a line item' do
      string.ordered_list('first').text.must_have_content 'The first post title'
    end

    it 'finds the ordered list when passed an object matching a line item' do
      string.ordered_list(post).text.must_have_content 'The second post title'
    end
  end

  # ul
  #
  describe '#unordered_list' do
    it 'finds the unordered list when passed a unique string matching a line item' do
      string.unordered_list('well').text.must_have_content 'Write well'
    end

    it 'finds the unordered list when passed an object matching a line item' do
      string.unordered_list(guideline).text.must_have_content 'Write well'
    end
  end

  # tr
  #
  describe '#find_row' do
    it 'finds a row when passed a unique string' do
      string.find_row(unique).text.must_have_content unique
      string.find_row(unique).text.wont_have_content multiple
      string.row(unique).text.must_have_content unique
      string.row(unique).text.wont_have_content multiple
    end

    it 'finds a row when passed an instance object' do
      string.find_row(post).text.must_have_content unique
      string.find_row(post).text.wont_have_content multiple
    end
  end

  describe '#first_row' do
    describe 'passing a string that appears multiple times within the table' do
      let(:result) { string.first_row(multiple) }

      it 'finds the first row' do
        result.text.must_have_content 'The first post title'
      end

      it 'does not return the second row' do
        result.text.wont_have_content 'The second post title'
      end
    end

    describe 'passing an instance' do
      let(:result) { string.first_row(post) }

      it 'finds the first row when passed an instance object' do
        result.text.must_have_content 'The third post title'
      end

      it 'does not return the second row when passed an instance object' do
        result.text.wont_have_content 'The second post title'
      end
    end
  end

  describe '#row_number' do
    it 'returns the row of the number passed in' do
      string.find_table('Jane Doe').row_number(1).text.must_have_content 'The first post title'
      string.find_table('Jane Doe').row_number(2).text.must_have_content 'The second post title'
    end
  end

  # paragraph
  #
  describe '#find_paragraph' do
    it 'finds a paragraph when passed a unique string' do
      string.find_paragraph(unique).text.must_have_content 'John Doe'
      string.find_paragraph(unique).text.wont_have_content 'Jane Doe'
      string.paragraph(unique).text.must_have_content 'John Doe'
      string.paragraph(unique).text.wont_have_content 'Jane Doe'
    end
  end

  describe '#first_paragraph' do
    it 'finds the first paragraph containing a string' do
      string.first_paragraph(multiple).text.must_have_content 'Jane Doe'
      string.first_paragraph(multiple).text.wont_have_content 'John Doe'
    end
  end

  # table
  #
  describe '#find_table' do
    it 'finds a table when passed a unique string' do
      string.find_table(unique).text.must_have_content unique
      string.find_table(unique).text.wont_have_content multiple
      string.table(unique).text.must_have_content unique
      string.table(unique).text.wont_have_content multiple
    end

    it 'finds a table when passed a string that occurs multiple times within the table' do
      string.find_table(multiple).text.must_have_content multiple
      string.find_table(multiple).text.wont_have_content unique
    end

    it 'finds a row when passed an instance object' do
      string.find_table(post).text.must_have_content unique
    end
  end

  describe '#first_table' do
    describe 'passing a string that appears in multiples tables' do
      let(:result) { string.first_table('Author') }

      it 'finds the first table' do
        result.text.must_have_content 'John Doe'
      end

      it 'does not return the second table' do
        result.text.wont_have_content 'Jane Doe'
      end
    end
  end


  # nav
  #
  describe '#navigation' do

  end

  # items ordered using li_number or row_number
end
