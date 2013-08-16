require 'test_helper'
require 'capybara_hunter'

describe '.string' do
  let :string do
    Capybara.string <<-STRING
        <html>
          <head>
            <title>simple_node</title>
          </head>
          <body>
            <div id="page">
              <div id="content">
                <h1 data="fantastic">Totally awesome</h1>
                <p>Yes it is</p>
              </div>

              <form>
                <input type="text" name="bleh" disabled="disabled"/>
                <input type="text" name="meh"/>
              </form>

              <table class='table table-striped table-bordered animals'>
                <thead>
                  <tr>
                    <th>Name</th>
                    <th>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <tr class="animal" id="animal_1"><td>Dogs</td>
                  <td>
                    <a href="/animals/dogs/edit" class="btn btn-mini">Edit</a>
                    <a href="/animals/dogs" class="btn btn-mini btn-danger" data-confirm="Are you sure?" data-method="delete" rel="nofollow">Delete</a>
                  </td>
                  </tr>
                  <tr class="animal" id="animal_2"><td>Cats</td>
                  <td>
                    <a href="/animals/cats/edit" class="btn btn-mini">Edit</a>
                    <a href="/animals/cats" class="btn btn-mini btn-danger" data-confirm="Are you sure?" data-method="delete" rel="nofollow">Delete</a>
                  </td>
                  </tr>
                </tbody>
              </table>

              <table class='table table-striped table-bordered vegetables'>
                <thead>
                  <tr>
                    <th>Name</th>
                    <th>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <tr class="vegetable" id="vegetable_1"><td>Peas</td>
                  <td>
                    <a href="/vegetables/peas/edit" class="btn btn-mini">Edit</a>
                    <a href="/vegetables/peas" class="btn btn-mini btn-danger" data-confirm="Are you sure?" data-method="delete" rel="nofollow">Delete</a>
                  </td>
                  </tr>
                  <tr class="vegetable" id="vegetable_2"><td>Peppers</td>
                  <td>
                    <a href="/vegetables/peppers/edit" class="btn btn-mini">Edit</a>
                    <a href="/vegetables/peppers" class="btn btn-mini btn-danger" data-confirm="Are you sure?" data-method="delete" rel="nofollow">Delete</a>
                  </td>
                  </tr>
                </tbody>
              </table>

              <table id='root-vegetables' class='table table-striped table-bordered vegetables root'>
                <thead>
                  <tr>
                    <th>Name</th>
                    <th>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <tr class="vegetable" id="vegetable_1"><td>Carrots</td>
                  <td>
                    <a href="/vegetables/carrots/edit" class="btn btn-mini">Edit</a>
                    <a href="/vegetables/carrots" class="btn btn-mini btn-danger" data-confirm="Are you sure?" data-method="delete" rel="nofollow">Delete</a>
                  </td>
                  </tr>
                  <tr class="vegetable" id="vegetable_2"><td>Potatoes</td>
                  <td>
                    <a href="/vegetables/potatoes/edit" class="btn btn-mini">Edit</a>
                    <a href="/vegetables/potatoes" class="btn btn-mini btn-danger" data-confirm="Are you sure?" data-method="delete" rel="nofollow">Delete</a>
                  </td>
                  </tr>
                </tbody>
              </table>

              <div id="footer">
                <p>c2010</p>
                <p>Jonas Nicklas</p>
                <input type="text" name="foo" value="bar"/>
                <select name="animal">
                  <option>Monkey</option>
                  <option selected="selected">Capybara</option>
                </select>
              </div>

              <div id="hidden" style="display: none">
                <p id="secret">Secret</p>
              </div>

              <section>
                <div class="subsection"></div>
              </section>
            </div>
          </body>
        </html>
    STRING
  end

  it 'verifies that find is working' do
    string.find('h1').text.must_equal 'Totally awesome'
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
      let(:dog) { Animal.new(1, 'animal') }

      it 'finds the table of animal categories when passed an instance' do
        string.table(dog).text.must_have_content 'Dogs'
      end
    end
  end
end
