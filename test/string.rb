TestString =  <<-STRING
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

  <h1>Guidelines</h2>
  <ul>
    <li class='guidelines' id='guideline_1'>Write well</li>
    <li class='guidelines' id='guideline_2'>Write frequently</li>
    <li class='guidelines' id='guideline_3'>Write in Latin</li>
  </ul>

  <h1>Most popular posts<h1>
  <ol>
    <li class='posts' id='post_1'>The first post title</li>
    <li class='posts' id='post_3'>The third post title</li>
    <li class='posts' id='post_2'>The second post title</li>
  </ol>

  <p>
    This is a paragraph with the unique string of John Doe.
  </p>

  <p>
    The first paragraph for Jane Doe.
  </p>

  <p>
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

  <nav>
    <h1>Users</h1>
    <ul>
      <li>Jane Doe</li>
      <li>John Doe</li>
  </nav>
STRING
