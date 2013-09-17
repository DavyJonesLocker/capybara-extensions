require 'test_helper'
require 'capybara_extensions'

describe '.string' do
  let(:post) { Post.new(3) }
  let(:string) { Capybara.string TestString }
  let(:unique) { 'John Doe' }
  let(:multiple) { 'Jane Doe' }

  describe '#must_have_input' do
    it 'finds the field with the value John Doe' do
      #string.must_have_input('user', with: unique)
      string.find_form(unique).must_have_input('user', with: unique)
    end
  end
end
