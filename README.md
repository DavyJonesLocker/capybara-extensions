# CapybaraExtensions

[![Gem Version](https://badge.fury.io/rb/capybara-extensions.png)](http://badge.fury.io/rb/capybara-extensions)
[![Build Status](https://travis-ci.org/dockyard/capybara-extensions.png?branch=master)](https://travis-ci.org/dockyard/capybara-extensions)

[Capybara](https://github.com/jnicklas/capybara) has an intuitive API which mimics the language of an actual user. This library extends Capybara's finders and matchers with additional methods for interacting with tables, lists, and list items, as well as many HTML5 elements.

## Installation
Add this line to your application's Gemfile to install from [RubyGems](https://rubygems.org/gems/capybara-extensions):

    gem 'capybara-extensions'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capybara-extensions

## Setup
Require `capybara-extensions`:

```ruby
require 'capybara-extensions'
```

## Usage
`CapybaraExtensions` extends Capybara's finders and matchers. Our goal is to cull many of the find statements from our tests and remove the verbose CSS and xpath locators that come along with them. Jonas Nicklas, who maintains Capybara, has [an excellent post](http://www.elabs.se/blog/51-simple-tricks-to-clean-up-your-capybara-tests) about augmenting Capybara with helper methods; this is what `CapybaraExtensions` aims to do.

You can read more about the library in [this blog post](http://reefpoints.dockyard.com/2013/11/11/capybara-extensions.html).

### Finders
The library contains helper methods for finding elements like `form`, `table`, and `li`, as well as many HTML5 elements like `article`, `aside`, `footer`, `header`, and `nav`.
A complete reference of the finders added by `CapybaraExtensions` is available at [Rubydoc.info](http://rubydoc.info/gems/capybara-extensions/frames). 

So the following code:
```ruby
within find('form#session-new') do
  ...
end
```

becomes the following:
```ruby
within form('Login') do
  ...
end
```

Each `find` method also has a corresponding `first` method. So when you have multiple article elements on a page with the text 'Lorem ipsum,' you can call `first_article('Lorem ipsum')` without returning an ambiguous match in Capybara. If you don't supply an argument to `#first_article`, it will return the first article regardless of the article's content.

In instances when you have lists or tables and you'd like to verify the content of a specific `li` or `tr`, `CapybaraExtensions` allows you to target the nth occurence of the element via `#list_item_number` and `#row_number`.

So given the following HTML:

```html
<ul>
  <li>John Doe</li>
  <li>Jane Doe</li>
  <li>Juan Doe</li>
</ul>
```

You can find the second li with:

```ruby
list_item_number(2) # => 'Jane Doe'
```

Use these methods for testing how elements are being ordered.

### Matchers
`CapybaraExtensions` extends Capybara's matchers with methods for verifying the presence of images, the value of input fields, and the presence of meta tags. All of these methods return a boolean.
A complete reference of the matchers added by `CapybaraExtensions` is available at [Rubydoc.info](http://rubydoc.info/gems/capybara-extensions/frames). 

`CapybaraExtensions` comes with a `#has_field_value?` method which checks the value of a form field. Ensuring that your records save and update correctly should be the domain of your unit tests, however this method can come in handy when you're not persisting data to the back-end. For example, after performing a search, you may want to ensure that the query persists in the search field after redirect.

```ruby
within form('Search') do
  has_field_value?('search', 'capybara images')
end
# => true
```

Asserting that text appears on the page is easy with Capybara's `#has_content?` method; asserting that a particular image appears has always been a little tougher. `#has_image?` takes a hash with the `src` and/or `alt` attributes you're looking for. You can pass a string for either of these keys, and an instance of Regexp to the `src` attribute when you want to hone in on a portion of the URL.

```ruby
page.has_image?(src: 'http://gallery.photo.net/photo/8385754-md.jpg',
alt: 'Capybara')
# => true
```

## Versioning
This gem follows [semantic versioning](http://semver.org).

## Contributing
Please see our [contribution guidelines](/CONTRIBUTING.md) on how to
properly submit issues and pull requests.

## Legal
[DockYard, Inc](http://dockyard.com) © 2014

Licensed under the [MIT
license](http://www.opensource.org/licenses/mit-license.php).
