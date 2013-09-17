require 'test_helper'
require 'capybara_extensions'

describe '.string' do
  let(:guideline) { Guideline.new(1, 'Write well') }
  let(:post) { Post.new(3) }
  let(:string) { Capybara.string TestString }
  let(:unique) { 'John Doe' }
  let(:multiple) { 'Jane Doe' }

  # article
  #
  describe '#find_article' do
    it 'finds the article when passed a unique string' do
      string.find_article(unique).text.must_have_content unique
      string.find_article(unique).text.wont_have_content multiple
      string.article(unique).text.must_have_content unique
      string.article(unique).text.wont_have_content multiple
    end

    it 'finds the article when passed an instance' do
      string.find_article(post).text.must_have_content unique
      string.find_article(post).text.wont_have_content multiple
      string.article(post).text.must_have_content unique
      string.article(post).text.wont_have_content multiple
    end
  end

  describe '#first_article' do
    it 'finds the first article when passed a non-unique string' do
      string.first_article(multiple).text.must_have_content multiple
      string.first_article(multiple).text.wont_have_content unique
    end
  end


  # li
  #
  describe '#find_list_item' do
    it 'finds the list item when passed a unique string' do
      string.find_list_item('foo').text.must_have_content 'foo'
      string.find_list_item('foo').text.wont_have_content 'bar'
      string.list_item('foo').text.must_have_content 'foo'
      string.list_item('foo').text.wont_have_content 'bar'
    end

    it 'finds the list item when passed an instance' do
      string.find_list_item(post).text.must_have_content 'foo'
      string.find_list_item(post).text.wont_have_content 'bar'
      string.list_item(post).text.must_have_content 'foo'
      string.list_item(post).text.wont_have_content 'bar'
    end
  end

  describe '#list_item_number' do
    it 'return the list item of the number passed in to an ol' do
      string.find_unordered_list('foo').list_item_number(2).must_have_content 'bar'
      string.find_unordered_list('foo').list_item_number(2).wont_have_content 'foo'
    end
  end

  # ol
  #
  describe '#find_ordered_list' do
    it 'finds the ordered list when passed a unique string' do
      string.find_ordered_list(unique).text.must_have_content unique
      string.find_ordered_list(unique).text.wont_have_content multiple
      string.ordered_list(unique).text.must_have_content unique
      string.ordered_list(unique).text.wont_have_content multiple
    end

    it 'finds the ordered list when passed an instance' do
      string.find_ordered_list(post).text.must_have_content unique
      string.find_ordered_list(post).text.wont_have_content multiple
      string.ordered_list(post).text.must_have_content unique
      string.ordered_list(post).text.wont_have_content multiple
    end
  end

  describe '#first_ordered_list' do
    it 'finds the first ordered list when passed a non-unique string' do
      string.first_ordered_list(multiple).text.must_have_content multiple
      string.first_ordered_list(multiple).text.wont_have_content unique
    end
  end

  # ul
  #
  describe '#find_unordered_list' do
    it 'finds the unordered list when passed a unique string' do
      string.find_unordered_list(unique).text.must_have_content unique
      string.find_unordered_list(unique).text.wont_have_content multiple
      string.unordered_list(unique).text.must_have_content unique
      string.unordered_list(unique).text.wont_have_content multiple
    end

    it 'finds the unordered list when passed an instance' do
      string.find_unordered_list(post).text.must_have_content unique
      string.find_unordered_list(post).text.wont_have_content multiple
      string.unordered_list(post).text.must_have_content unique
      string.unordered_list(post).text.wont_have_content multiple
    end
  end

  describe '#first_unordered_list' do
    it 'finds the first unordered list when passed a non-unique string' do
      string.first_unordered_list(multiple).text.must_have_content multiple
      string.first_unordered_list(multiple).text.wont_have_content unique
    end
  end

  # tr
  #
  describe '#find_row' do
    it 'finds the row when passed a unique string' do
      string.find_row(unique).text.must_have_content unique
      string.find_row(unique).text.wont_have_content multiple
      string.row(unique).text.must_have_content unique
      string.row(unique).text.wont_have_content multiple
    end

    it 'finds the row when passed an instance' do
      string.find_row(post).text.must_have_content unique
      string.find_row(post).text.wont_have_content multiple
      string.row(post).text.must_have_content unique
      string.row(post).text.wont_have_content multiple
    end
  end

  describe '#first_row' do
    it 'finds the first nav when passed a non-unique string' do
      string.first_row(multiple).text.must_have_content multiple
      string.first_row(multiple).text.wont_have_content unique
    end
  end

  describe '#row_number' do
    it 'returns the row of the number passed in' do
      string.find_table('Jane Doe').row_number(1).text.must_have_content 'The first post title'
      string.find_table('Jane Doe').row_number(1).text.wont_have_content 'The second post title'
      string.find_table('Jane Doe').row_number(2).text.must_have_content 'The second post title'
      string.find_table('Jane Doe').row_number(2).text.wont_have_content 'The first post title'
    end
  end

  # paragraph
  #
  describe '#find_paragraph' do
    it 'finds the paragraph when passed a unique string' do
      string.find_paragraph(unique).text.must_have_content unique
      string.find_paragraph(unique).text.wont_have_content multiple
      string.paragraph(unique).text.must_have_content unique
      string.paragraph(unique).text.wont_have_content multiple
    end

    it 'finds the paragraph when passed an instance' do
      string.find_paragraph(post).text.must_have_content unique
      string.find_paragraph(post).text.wont_have_content multiple
      string.paragraph(post).text.must_have_content unique
      string.paragraph(post).text.wont_have_content multiple
    end
  end

  describe '#first_paragraph' do
    it 'finds the first paragraph containing a string' do
      string.first_paragraph(multiple).text.must_have_content multiple
      string.first_paragraph(multiple).text.wont_have_content unique
    end
  end

  # table
  #
  describe '#find_table' do
    it 'finds the table when passed a unique string' do
      string.find_table(unique).text.must_have_content unique
      string.find_table(unique).text.wont_have_content multiple
      string.table(unique).text.must_have_content unique
      string.table(unique).text.wont_have_content multiple
    end

    it 'finds the table when passed a non-unique string' do
      string.find_table(multiple).text.must_have_content multiple
      string.find_table(multiple).text.wont_have_content unique
    end

    it 'finds the table when passed an instance object' do
      string.find_table(post).text.must_have_content unique
      string.find_table(post).text.wont_have_content multiple
    end
  end

  describe '#first_table' do
    it 'finds the first table when passed a non-unique string' do
      string.first_table(multiple).text.must_have_content multiple
      string.first_table(multiple).text.wont_have_content unique
    end
  end


  # nav
  #
  describe '#nav' do
    it 'finds the nav when passed a unique string' do
      string.find_nav(unique).text.must_have_content unique
      string.find_nav(unique).text.wont_have_content multiple
      string.nav(unique).text.must_have_content unique
      string.nav(unique).text.wont_have_content multiple
    end

    it 'finds the nav when passed an instance' do
      string.find_nav(post).text.must_have_content multiple
      string.find_nav(post).text.wont_have_content unique
      string.nav(post).text.must_have_content multiple
      string.find_nav(post).text.wont_have_content unique
    end
  end

  describe '#first_nav' do
    it 'finds the first nav when passed a non-unique string' do
      string.first_nav(multiple).text.must_have_content multiple
      string.first_nav(multiple).text.wont_have_content unique
    end
  end

  # section
  #
  describe '#section' do
    it 'finds a section when passed a unique string' do
      string.find_section(unique).text.must_have_content unique
      string.find_section(unique).text.wont_have_content multiple
      string.section(unique).text.must_have_content unique
      string.section(unique).text.wont_have_content multiple
    end

    it 'finds a section when passed an instance' do
      string.find_section(post).text.must_have_content unique
      string.find_section(post).text.wont_have_content multiple
      string.section(post).text.must_have_content unique
      string.section(post).text.wont_have_content multiple
    end
  end

  # items ordered using li_number or row_number
end
