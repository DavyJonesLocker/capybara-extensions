require 'test_helper'
require 'capybara_hunter'

describe '.string' do
  let(:dog) { Animal.new(1, 'animal') }
  let(:string) { Capybara.string TestString }

  it 'verifies that find is working' do
    string.find('h1').text.must_equal 'Totally awesome'
  end

  describe '#row' do
    it 'finds the row of peas when passed a string' do
      string.first(*string.row('Peas')).text.must_have_content 'Peas'
    end

    describe 'passing a hash' do
      it 'finds the first animal row when passed a single class via hash' do
        string.first(string.row({ class: 'animal' })).text.must_have_content 'Dogs'
        string.first(string.row({ class: 'animal' })).text.wont_have_content 'Peas'
      end

      it 'finds the first root vegetable row when passed multiple classes via hash' do
        string.first(string.row({ class: 'vegetable.root' })).text.must_have_content 'Carrots'
        string.first(string.row({ class: 'vegetable.root' })).text.wont_have_content 'Dogs'
        string.first(string.row({ class: 'vegetable.root' })).text.wont_have_content 'Peas'
      end

       it 'finds the first root vegetable row when passed a single id via hash' do
         string.first(string.row({ id: 'vegetable_1' })).text.must_have_content 'Peas'
         string.first(string.row({ id: 'vegetable_1' })).text.wont_have_content 'Carrots'
       end

       it 'finds the row with class vegetable and content peppers' do
         string.find(*string.row({ class: 'vegetable', content: 'Peppers' })).text.must_have_content 'Peppers'
         string.find(*string.row({ class: 'vegetable', content: 'Peppers' })).text.wont_have_content 'Peas'
       end
    end

    describe 'passing an instance' do
      it 'finds the dog row of when passed an instance' do
        string.find(string.row(dog)).text.must_have_content 'Edit Dogs'
        string.find(string.row(dog)).text.wont_have_content 'Cats'
      end
    end
  end

  describe '#table' do
    it 'finds the table of vegetable types when passed a string that appears within the table' do
      string.table('Peas').text.must_have_content 'Peas'
      string.table('Peas').text.wont_have_content 'Dogs'
    end

    describe 'passing a hash' do
      it 'finds the table of animals when passed a single class via hash' do
        string.table({ class: 'animals' }).text.must_have_content 'Dogs'
        string.table({ class: 'animals' }).text.wont_have_content 'Peas'
      end

      it 'finds the table of root vegetable when passed a multiple classes via hash' do
        string.table({ class: 'vegetables.root' }).text.must_have_content 'Carrots'
        string.table({ class: 'vegetables.root' }).text.wont_have_content 'Dogs'
        string.table({ class: 'vegetables.root' }).text.wont_have_content 'Peas'
      end

       it 'finds the table of root vegetable when passed a single id via hash' do
         string.table({ id: 'root-vegetables' }).text.must_have_content 'Carrots'
         string.table({ id: 'root-vegetables' }).text.wont_have_content 'Dogs'
       end
    end

    describe 'passing an instance' do
      it 'finds the table of animal categories when passed an instance' do
        string.table(dog).text.must_have_content 'Dogs'
        string.table(dog).text.wont_have_content 'Cats'
      end
    end
  end
end
