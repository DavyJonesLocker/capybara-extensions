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

              <table class='table table-striped table-bordered'>
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

              <table class='table table-striped table-bordered'>
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
    it 'finds the table of animal categories when passed a string' do
      string.table('Carrots').text.must_have_content 'Carrots'
      string.table('Carrots').text.wont_have_content 'Dogs'
    end

    it 'finds the table of animal categories when passed a hash' do
      string.table({ class: 'table' }).text.must_have_content 'Carrots'
      string.table({ class: 'table' }).text.wont_have_content 'Dogs'
    end

    it 'finds the table of animal categories when passed an instance' do
    end
  end
end
