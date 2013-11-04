require 'test_helper'

describe '.string' do
  let(:post) { Post.new(3) }
  let(:string) { Capybara.string TestString }
  let(:unique) { 'John Doe' }
  let(:multiple) { 'Jane Doe' }

  # images
  describe '#has_image?' do
    it 'returns true if the image has an alt with the argument' do
      string.has_image?(alt: unique).must_equal true
    end

    it 'returns false if the image does not have an alt with the argument' do
      string.has_image?(alt: multiple).must_equal false
    end

    it 'returns true if the image has an src with the argument' do
      string.has_image?(src: 'http://example.com/johndoe').must_equal true
    end

    it 'returns false if the image does not have an src with the argument' do
      string.has_image?(src: 'http://example.com/johndoh').must_equal false
    end

    it 'returns true if the image has an alt and an src with the arguments' do
      string.has_image?(alt: unique, src: 'http://example.com/johndoe').must_equal true
    end

    it 'returns false if the image does not have an alt and an src with the arguments' do
      string.has_image?(alt: unique, src: 'http://example.com/johndoh').must_equal false
    end
  end

  describe '#has_no_image?' do
    it 'returns true if there is no image with the alt' do
      string.has_no_image?(alt: multiple).must_equal true
    end

    it 'returns false if there is an image with the alt' do
      string.has_no_image?(alt: unique).must_equal false
    end

    it 'returns true if there is no image with the src' do
      string.has_no_image?(src: 'http://example.com/johndoh').must_equal true
    end

    it 'returns false if there is an image with the src' do
      string.has_no_image?(src: 'http://example.com/johndoe').must_equal false
    end

    it 'returns true if there is no image with an alt and a src with the arguments' do
      string.has_no_image?(alt: unique, src: 'http://example.com/johndoh').must_equal true
    end
  end

  # field_values
  describe '#has_field_value?' do
    it 'returns true when the field has the passed in value' do
      string.find_form(unique).has_field_value?('name', unique).must_equal true
    end

    it 'fails if has_field_value? returns false' do
      assert_raises(Capybara::ExpectationNotMet) do
        string.find_form(unique).has_field_value?(:name, multiple)
      end.must_have_content 'expected to find field name with a value of Jane Doe.'
    end
  end

  describe '#has_no_field_value?' do
    it 'returns true if the field does not have the passed in value' do
      string.find_form(unique).has_no_field_value?('name', 'John Doh').must_equal true
    end

    it 'fails if has_no_field_value? returns false' do
      assert_raises(Capybara::ExpectationNotMet) do
        string.find_form(unique).has_no_field_value?('name', unique)
      end.must_have_content 'expected to not find field name with a value of John Doe.'
    end
  end

  # meta tags
  describe '#has_meta_tag?' do
    it 'returns true when the meta tag name and content are present' do
      string.has_meta_tag?('title', 'CapybaraExtensions!').must_equal true
    end

    it 'returns false when the meta tag name is not present' do
      string.has_meta_tag?('nonexistent_name', 'CapybaraExtensions!').must_equal false
    end

    it 'returns false when the meta tag content is not present' do
      string.has_meta_tag?('title', 'Nonexistent content').must_equal false
    end
  end

  describe '#has_no_meta_tag?' do
    it 'returns true when the meta tag name and content are not present' do
      string.has_no_meta_tag?('title', 'foo').must_equal true
    end

    it 'returns true when the meta tag name is not present' do
      string.has_no_meta_tag?('nonexistent_name', 'CapybaraExtensions!').must_equal true
    end

    it 'returns true when the meta tag content is not present' do
      string.has_no_meta_tag?('title', 'Nonexistent content').must_equal true
    end

    it 'returns false when the meta tag name and content are present' do
      string.has_no_meta_tag?('title', 'CapybaraExtensions!').must_equal false
    end
  end
end
