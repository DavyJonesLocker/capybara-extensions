require 'test_helper'
require 'capybara_hunter'

describe '.string' do
  let(:post) { Post.new(1, 'The fourth post title', 'Vivamus porttitor augue quis nibh ultrices, sed venenatis sem sollicitudin. Cras gravida tortor neque, quis lobortis nunc ultrices vitae. Pellentesque.', author: 'Juan Doe') }
  let(:string) { Capybara.string TestString }
  let(:unique) { 'Jane Doe' }
  let(:multi_in_table) { 'John Doe' }
  let(:multi_in_tables) { ' id ' }

  describe '#find_row' do
    it 'finds a unique row when passed a string' do
      string.find_row(unique).text.must_have_content unique
      string.find_row(unique).text.wont_have_content multi_in_table
    end
  # When passed a string/object for a row that is unique on the page, find_row returns the row
  #
  # When passed a string/object for a row that is unique to a table, find_row returns the row 
  # if nested in a within block for the table
  #
  # When passed an object for a row that is built without an id or class, find_row will not
  # return any results
  #
  # When passed a string for a row that is not unique, find_row will return 'ambiguous'
  end

  describe '#find_table' do
    # When passed a string that appears once on the page, find_table returns
    # the table.
    it 'finds a table when passed a unique string' do
      string.find('table', text: unique).text.must_have_content unique
      string.find('table', text: unique).text.wont_have_content multi_in_table
    end

    # When passed a string that appears multiple times in a single table, find_table
    # returns the table
    it 'finds a table when passed a string that appears multiple times in a single table' do
      string.find('table', text: multi_in_table).text.must_have_content multi_in_table
      string.find('table', text: multi_in_table).text.wont_have_content unique
    end

    # When passed a string that appear in multiple tables, find_table return
    # 'ambiguous match'
  end
end
