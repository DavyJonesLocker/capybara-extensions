require 'test_helper'
require 'capybara_hunter'

describe '.string' do
  let(:post) { Post.new(1, 'The fourth post title', 'Vivamus porttitor augue quis nibh ultrices, sed venenatis sem sollicitudin. Cras gravida tortor neque, quis lobortis nunc ultrices vitae. Pellentesque.', author: 'Juan Doe') }
  let(:string) { Capybara.string TestString }
  let(:unique) { 'Adipiscing' }
  let(:duplicate) { 'Suspendisse' }

  describe '#find_' do
    it 'finds a row when passed a unique string' do
      string.find_row(unique).text.must_have_content unique
      string.find_row(unique).text.wont_have_content duplicate
    end

    it 'finds a table when passed a unique string' do
      string.find_table(unique).text.must_have_content 'Adipiscing'
      string.find_table(unique).text.wont_have_content duplicate
    end

    describe 'passing an instance' do
      it 'finds the post row of when passed an instance' do
        string.find_row(post).text.must_have_content 'Edit unique'
        #string.find(string.row(post)).text.must_have_content 'Edit unique'
        #string.find(string.row(post)).text.wont_have_content 'Cats'
      end
    end

    #describe 'passing a hash' do
      #it 'finds a unique element when passed its class' do
        #string.find_row(class: 'animal').text.must_have_content 'unique'
      #end

      #it 'finds the first root vegetable row when passed multiple classes via hash' do
        #string.first(string.row({ class: 'vegetable.root' })).text.must_have_content 'Carrots'
        #string.first(string.row({ class: 'vegetable.root' })).text.wont_have_content 'unique'
        #string.first(string.row({ class: 'vegetable.root' })).text.wont_have_content 'duplicate'
      #end

       #it 'finds the first root vegetable row when passed a single id via hash' do
         #string.first(string.row({ id: 'vegetable_1' })).text.must_have_content 'duplicate'
         #string.first(string.row({ id: 'vegetable_1' })).text.wont_have_content 'Carrots'
       #end

       #it 'finds the row with class vegetable and content peppers' do
         #string.find(*string.row({ class: 'vegetable', content: 'Peppers' })).text.must_have_content 'Peppers'
         #string.find(*string.row({ class: 'vegetable', content: 'Peppers' })).text.wont_have_content 'duplicate'
       #end
    #end
  end

  #describe '#table' do
    #it 'finds the table of vegetable types when passed a string that appears within the table' do
      #string.find(*string.table('duplicate')).text.must_have_content 'duplicate'
      #string.find(*string.table('duplicate')).text.wont_have_content 'unique'
    #end

    #describe 'passing a hash' do
      #it 'finds the table of animals when passed a single class via hash' do
        #string.find(string.table({ class: 'animals' })).text.must_have_content 'unique'
        #string.find(string.table({ class: 'animals' })).text.wont_have_content 'duplicate'
      #end

      #it 'finds the table of root vegetable when passed a multiple classes via hash' do
        #string.find(string.table({ class: 'vegetables.root' })).text.must_have_content 'Carrots'
        #string.find(string.table({ class: 'vegetables.root' })).text.wont_have_content 'unique'
        #string.find(string.table({ class: 'vegetables.root' })).text.wont_have_content 'duplicate'
      #end

       #it 'finds the table of root vegetable when passed a single id via hash' do
         #string.find(string.table({ id: 'root-vegetables' })).text.must_have_content 'Carrots'
         #string.find(string.table({ id: 'root-vegetables' })).text.wont_have_content 'unique'
       #end
    #end

    #describe 'passing an instance' do
      #it 'finds the table of animal categories when passed an instance' do
        #string.find(string.table(post)).text.must_have_content 'unique'
        #string.find(string.table(post)).text.wont_have_content 'Cats'
      #end
    #end
  #end
end
