require 'test_helper'

describe '.string' do
  let(:post) { Post.new(3) }
  let(:string) { Capybara.string TestString }
  let(:unique) { 'John Doe' }
  let(:multiple) { 'Jane Doe' }

  # Finders
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


  # navigation
  #
  describe '#navigation' do
    it 'finds the navigation when passed a unique string' do
      string.find_navigation(unique).text.must_have_content unique
      string.find_navigation(unique).text.wont_have_content multiple
      string.navigation(unique).text.must_have_content unique
      string.navigation(unique).text.wont_have_content multiple
    end

    it 'finds the nav when passed an instance' do
      string.find_navigation(post).text.must_have_content multiple
      string.find_navigation(post).text.wont_have_content unique
      string.navigation(post).text.must_have_content multiple
      string.find_navigation(post).text.wont_have_content unique
    end
  end

  describe '#first_navigation' do
    it 'finds the first navigation when passed a non-unique string' do
      string.first_navigation(multiple).text.must_have_content multiple
      string.first_navigation(multiple).text.wont_have_content unique
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

  # header
  #
  describe '#header' do
    it 'finds the header when passed a unique string' do
      string.find_header(unique).text.must_have_content unique
      string.find_header(unique).text.wont_have_content multiple
      string.header(unique).text.must_have_content unique
      string.header(unique).text.wont_have_content multiple
    end

    it 'finds the header when passed an instance' do
      string.find_header(post).text.must_have_content multiple
      string.find_header(post).text.wont_have_content unique
      string.header(post).text.must_have_content multiple
      string.find_header(post).text.wont_have_content unique
    end
  end

  describe '#first_header' do
    it 'finds the first header when passed a non-unique string' do
      string.first_header(multiple).text.must_have_content multiple
      string.first_header(multiple).text.wont_have_content unique
    end
  end

  # footer
  #
  describe '#footer' do
    it 'finds the footer when passed a unique string' do
      string.find_footer(unique).text.must_have_content unique
      string.find_footer(unique).text.wont_have_content multiple
      string.footer(unique).text.must_have_content unique
      string.footer(unique).text.wont_have_content multiple
    end

    it 'finds the footer when passed an instance' do
      string.find_footer(post).text.must_have_content multiple
      string.find_footer(post).text.wont_have_content unique
      string.footer(post).text.must_have_content multiple
      string.find_footer(post).text.wont_have_content unique
    end
  end

  describe '#first_footer' do
    it 'finds the first footer when passed a non-unique string' do
      string.first_footer(multiple).text.must_have_content multiple
      string.first_footer(multiple).text.wont_have_content unique
    end
  end

  # aside
  #
  describe '#aside' do
    it 'finds the aside when passed a unique string' do
      string.find_aside(unique).text.must_have_content unique
      string.find_aside(unique).text.wont_have_content multiple
      string.aside(unique).text.must_have_content unique
      string.aside(unique).text.wont_have_content multiple
    end

    it 'finds the aside when passed an instance' do
      string.find_aside(post).text.must_have_content multiple
      string.find_aside(post).text.wont_have_content unique
      string.aside(post).text.must_have_content multiple
      string.find_aside(post).text.wont_have_content unique
    end
  end

  describe '#first_aside' do
    it 'finds the first aside when passed a non-unique string' do
      string.first_aside(multiple).text.must_have_content multiple
      string.first_aside(multiple).text.wont_have_content unique
    end
  end

  # form
  #
  describe '#form' do
    it 'finds the form when passed a unique string' do
      string.find_form(unique).text.must_have_content unique
      string.find_form(unique).text.wont_have_content multiple
      string.form(unique).text.must_have_content unique
      string.form(unique).text.wont_have_content multiple
    end

    it 'finds the form when passed an instance' do
      string.find_form(post).text.must_have_content multiple
      string.find_form(post).text.wont_have_content unique
      string.form(post).text.must_have_content multiple
      string.find_form(post).text.wont_have_content unique
    end
  end

  describe '#first_form' do
    it 'finds the first form when passed a non-unique string' do
      string.first_form(multiple).text.must_have_content multiple
      string.first_form(multiple).text.wont_have_content unique
    end
  end

  # image
  #
  describe '#find_image' do
    let(:image) { 'http://example.com/johndoe' }

    it 'finds an image when passed src and alt' do
      string.find_image(src: 'http://example.com/johndoe', alt: 'John Doe').native.attributes['src'].value.must_equal image
      string.find_image(src: 'http://example.com/johndoe').native.attributes['src'].value.must_equal image
      string.find_image(alt: 'John Doe').native.attributes['src'].value.must_equal image
    end
  end
end
