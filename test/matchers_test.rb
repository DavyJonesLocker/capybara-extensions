require 'test_helper'
require 'capybara_extensions'

describe '.string' do
  let(:post) { Post.new(3) }
  let(:string) { Capybara.string TestString }
  let(:unique) { 'John Doe' }
  let(:multiple) { 'Jane Doe' }

  describe '#has_image?' do
    it 'returns true if the image has an alt with the argument' do
      string.has_image?(alt: unique).must_equal true
    end

    it 'returns true if the image has an src with the argument' do
      string.has_image?(src: 'http://example.com/johndoe').must_equal true
    end

    it 'returns true if the image has an alt and an src with the arguments' do
      string.has_image?(alt: unique, src: 'http://example.com/johndoe').must_equal true
    end
  end

  describe '#has_field_value?' do
    it 'returns true when the field has the passed in value' do
      string.find_form(unique).has_field_value?('name', with: unique)
    end
  end

  describe '#has_no_image?' do
    it 'returns true if the image does not have an alt with the argument' do
      string.has_no_image?(alt: multiple).must_equal true
    end

    it 'returns true if the image does not have an src with the argument' do
      string.has_no_image?(src: 'http://example.com/janedoe').must_equal true
    end

    it 'returns true if the image has neither an alt or an src with the arguments' do
      string.has_no_image?(alt: multiple, src: 'http://example.com/janedoe').must_equal true
    end

    it 'returns false if the image has an alt but not a src with the arguments' do
      string.has_no_image?(alt: multiple, src: 'http://example.com/janedoe').must_equal true
    end
  end

  describe '#has_no_field_value?' do
    it 'returns true if the field does not have the passed in value' do
      string.find_form(unique).has_no_field_value?('name', with: multiple)
    end
  end
end
