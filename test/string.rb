TestString =  <<-STRING
  <html>
    <head>
      <meta name='title' content='CapybaraExtensions!' />
    </head>
    <h1>Posts by John</h1>
    <table>
      <thead>
        <tr>
          <th>Author</th>
          <th>Title</th>
          <th>Body</th>
          <th colspan=3>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr class="post" id="post_3">
      <td>John Doe</td>
      <td>The third post title</td>
      <td>Sed id tortor odio. Proin a adipiscing quam. Donec posuere condimentum dolor, mollis consectetur diam consectetur eu. Etiam ipsum augue, imperdiet ac porttitor tristique, hendrerit.</td>
      <td><a href="/posts/3">Show</a></td>
      <td><a href="/posts/3/edit">Edit</a></td>
      <td><a data-confirm="Are you sure?" data-method="delete" href="/posts/3" rel="nofollow">Destroy</a></td>
    </tr>
      </tbody>
    </table>

    <h1>Posts by Jane</h1>
    <table>
      <thead>
        <tr>
          <th>Author</th>
          <th>Title</th>
          <th>Body</th>
          <th colspan=3>Actions</th>
        </tr>
      </thead>
      <tbody>
    <tr class="post" id="post_1">
      <td>Jane Doe</td>
      <td>The first post title</td>
      <td>Suspendisse id purus quis augue consequat varius ut eget diam. Donec ut lacus vestibulum, porttitor nulla porta, convallis ligula. Nunc sodales venenatis sapien sit amet consequat.</td>
      <td><a href="/posts/1">Show</a></td>
      <td><a href="/posts/1/edit">Edit</a></td>
      <td><a data-confirm="Are you sure?" data-method="delete" href="/posts/1" rel="nofollow">Destroy</a></td>
    </tr>
    <tr class="post" id="post_2">
      <td>Jane Doe</td>
      <td>The second post title</td>
      <td>Donec iaculis ultricies orci id consequat. Etiam varius dignissim tincidunt. Sed in lacinia augue. Proin ullamcorper quam at tincidunt consectetur.</td>
      <td><a href="/posts/2">Show</a></td>
      <td><a href="/posts/2/edit">Edit</a></td>
      <td><a data-confirm="Are you sure?" data-method="delete" href="/posts/2" rel="nofollow">Destroy</a></td>
    </tr>
      </tbody>
    </table>


    <ul>
      <li class='post' id='post_3'>foo</li>
      <li class='post' id='post_2'>bar</li>
      <li class='post' id='post_1'>bar</li>
    </ul>


    <ul class='posts' id='post_3'>
      John Doe
    </ul>

    <ul class='posts' id='post_2'>
      Jane Doe
    </ul>

    <ul class='posts' id='post_1'>
      Jane Doe
    </ul>


    <ol class='posts' id='post_3'>
      John Doe
    </ol>

    <ol class='posts' id='post_2'>
      Jane Doe
    </ol>

    <ol class='posts' id='post_1'>
      Jane Doe
    </ol>


    <p class='post' id='post_3'>
      This is a paragraph with the unique string of John Doe.
    </p>

    <p class='post' id='post_2'>
      The first paragraph for Jane Doe.
    </p>

    <p class='post' id='post_1'>
      The second paragraph for Jane Doe.
    </p>


    <article class='post' id='post_3'>
      This is an article for John Doe.
    </article>

    <article class='post' id='post_1'>
      This is an article for Jane Doe.
    </article>

    <article class='post' id='post_2'>
      This is another article for Jane Doe.
    </article>


    <nav class='post' id='post_1'>
      John Doe
    </nav>

    <nav class='post' id='post_2'>
      Jane Doe
    </nav>

    <nav class='post' id='post_3'>
      Jane Doe
    </nav>


    <section class='post' id='post_3'>
      A section with John Doe.
    </section>

    <section class='post' id='post_1'>
      A section with Jane Doe.
    </section>

    <section class='post' id='post_2'>
      Another section with Jane Doe.
    </section>


    <header class='post' id='post_1'>
      John Doe
    </header>

    <header class='post' id='post_2'>
      Jane Doe
    </header>

    <header class='post' id='post_3'>
      Jane Doe
    </header>


    <footer class='post' id='post_1'>
      John Doe
    </footer>

    <footer class='post' id='post_2'>
      Jane Doe
    </footer>

    <footer class='post' id='post_3'>
      Jane Doe
    </footer>

    <aside class='post' id='post_1'>
      John Doe
    </aside>

    <aside class='post' id='post_2'>
      Jane Doe
    </aside>

    <aside class='post' id='post_3'>
      Jane Doe
    </aside>

    <form class='post' id='post_1'>
      John Doe
      <input id='name' value='John Doe'>
      <input id='email' value='john@example.com'>
    </form>

    <form class='post' id='post_2'>
      Jane Doe
      <input id='name' value='Jane Doe'>
      <input id='email' value='jane@example.com'>
    </form>

    <form class='post' id='post_3'>
      Jane Doe
      <input id='name' value='Jane Doe'>
      <input id='email' value='jane@example.com'>
    </form>

    <img src='http://example.com/johndoe' alt='John Doe'/>
  </html>
STRING
