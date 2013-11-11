require_relative 'locators'

module CapybaraExtensions::Finders
  include CapybaraExtensions::Locators

  # Find an HTML article based on the given arguments.
  #
  # @param args [String] text contained within the article sought.
  # @param args [Object] the object whose article is sought.
  # @return [Capybara::Element] the found element.
  #
  def find_article(args)
    find_element('article', args)
  end

  alias_method :article, :find_article

  # Find an HTML aside based on the given arguments.
  #
  # @param args [String] text contained within the aside sought.
  # @param args [Object] the object whose aside is sought.
  # @return [Capybara::Element] the found element.
  #
  def find_aside(args)
    find_element('aside', args)
  end

  alias_method :aside, :find_aside

  # Find an HTML footer based on the given arguments.
  #
  # @param args [String] text contained within the footer sought.
  # @param args [Object] the object whose footer is sought.
  # @return [Capybara::Element] the found element.
  #
  def find_footer(args)
    find_element('footer', args)
  end

  alias_method :footer, :find_footer

  # Find an HTML form based on the given arguments.
  #
  # @param args [String] text contained within the form sought.
  # @param args [Object] the object whose form is sought.
  # @return [Capybara::Element] the found element.
  #
  def find_form(args)
    find_element('form', args)
  end

  alias_method :form, :find_form

  # Find an HTML img based on the src and/or alt values.
  #
  # @param options [Hash] Must pass a hash containing the src and/or alt of the image sought. You may pass a Regexp with src; however, this should be done sparingly, as CapybaraExtensions::Locators#image_locator will find and iterate over all images in the current scope.
  # @return [Capybara::Element] the found element
  #
  def find_image(options = {})
    raise "Must pass a hash containing 'src' or 'alt'" unless options.is_a?(Hash) && (options.has_key?(:src) || options.has_key?(:alt))
    find(:xpath, "//img#{image_locator(options)}")
  end

  # Find an HTML header based on the given arguments.
  #
  # @param args [String] text contained within the header sought.
  # @param args [Object] the object whose header is sought.
  # @return [Capybara::Element] the found element.
  #
  def find_header(args)
    find_element('header', args)
  end

  alias_method :header, :find_header

  # Find an HTML li based on the given arguments.
  #
  # @param args [String] text contained within the li sought.
  # @param args [Object] the object whose li is sought.
  # @return [Capybara::Element] the found element.
  #
  def find_list_item(args)
    find_element('li', args)
  end

  alias_method :list_item, :find_list_item

  # Find an HTML nav based on the given arguments.
  #
  # @param args [String] text contained within the nav sought.
  # @param args [Object] the object whose nav is sought.
  # @return [Capybara::Element] the found element.
  #
  def find_navigation(args)
    find_element('nav', args)
  end

  alias_method :navigation, :find_navigation

  # Find an HTML ol based on the given arguments.
  #
  # @param args [String] text contained within the ol sought.
  # @param args [Object] the object whose ol is sought.
  # @return [Capybara::Element] the found element.
  #
  def find_ordered_list(args)
    find_element('ol', args)
  end

  alias_method :ordered_list, :find_ordered_list

  # Find an HTML p based on the given arguments.
  #
  # @param args [String] text contained within the p sought.
  # @param args [Object] the object whose p is sought.
  # @return [Capybara::Element] the found element.
  #
  def find_paragraph(args)
    find_element('p', args)
  end

  alias_method :paragraph, :find_paragraph

  # Find an HTML tr based on the given arguments.
  #
  # @param args [String] text contained within the tr sought.
  # @param args [Object] the object whose tr is sought.
  # @return [Capybara::Element] the found element.
  #
  def find_row(args)
    find_element('tr', args)
  end

  alias_method :row, :find_row

  # Find an HTML section based on the given arguments.
  #
  # @param args [String] text contained within the section sought.
  # @param args [Object] the object whose section is sought.
  # @return [Capybara::Element] the found element.
  #
  def find_section(args)
    find_element('section', args)
  end

  alias_method :section, :find_section

  # Find an HTML table based on the given arguments.
  #
  # @param args [String] text contained within the table sought.
  # @param args [Object] the object whose table is sought.
  # @return [Capybara::Element] the found element.
  #
  def find_table(args)
    if String === args
      find_element('table', args)
    else
      row = find_row(args)
      row.find(:xpath, 'ancestor::table')
    end
  end

  alias_method :table, :find_table

  # Find an HTML ul based on the given arguments.
  #
  # @param args [String] text contained within the ul sought.
  # @param args [Object] the object whose ul is sought.
  # @return [Capybara::Element] the found element.
  #
  def find_unordered_list(args)
    find_element('ul', args)
  end

  alias_method :unordered_list, :find_unordered_list

  # Find the first HTML article on the page matching the given arguments.
  #
  # @param args [String] text contained within the article sought.
  # @param args [Object] the object whose article is sought.
  # @return [Capybara::Element] the found element.
  #
  def first_article(args)
    first_element('article', args)
  end

  # Find the first HTML aside on the page matching the given arguments.
  #
  # @param args [String, Object] if passed a string, the text contained within the aside sought; if passed an object, the object whose aside is sought.
  # @return [Capybara::Element] the found element.
  #
  def first_aside(args)
    first_element('aside', args)
  end

  # Find the first HTML footer on the page matching the given arguments.
  #
  # @param args [String, Object] if passed a string, the text contained within the footer sought; if passed an object, the object whose footer is sought.
  # @return [Capybara::Element] the found element.
  #
  def first_footer(args)
    first_element('footer', args)
  end

  # Find the first HTML form on the page matching the given arguments.
  #
  # @param args [String, Object] if passed a string, the text contained within the form sought; if passed an object, the object whose form is sought.
  # @return [Capybara::Element] the found element.
  #
  def first_form(args)
    first_element('form', args)
  end

  # Find the first HTML header on the page matching the given arguments.
  #
  # @param args [String, Object] if passed a string, the text contained within the header sought; if passed an object, the object whose header is sought.
  # @return [Capybara::Element] the found element.
  #
  def first_header(args)
    first_element('header', args)
  end

  # Find the first HTML nav on the page matching the given arguments.
  #
  # @param args [String, Object] if passed a string, the text contained within the nav sought; if passed an object, the object whose nav is sought.
  # @return [Capybara::Element] the found element.
  #
  def first_navigation(args)
    first_element('nav', args)
  end

  # Find the first HTML ol on the page matching the given arguments.
  #
  # @param args [String, Object] if passed a string, the text contained within the ol sought; if passed an object, the object whose ol is sought.
  # @return [Capybara::Element] the found element.
  #
  def first_ordered_list(args)
    first_element('ol', args)
  end

  # Find the first HTML p on the page matching the given arguments.
  #
  # @param args [String, Object] if passed a string, the text contained within the p sought; if passed an object, the object whose p is sought.
  # @return [Capybara::Element] the found element.
  #
  def first_paragraph(args)
    first_element('p', args)
  end

  # Find the first HTML tr on the page matching the given arguments.
  #
  # @param args [String, Object] if passed a string, the text contained within the tr sought; if passed an object, the object whose tr is sought.
  # @return [Capybara::Element] the found element.
  #
  def first_row(args)
    first_element('tr', args)
  end

  # Find the first HTML section on the page matching the given arguments.
  #
  # @param args [String, Object] if passed a string, the text contained within the section sought; if passed an object, the object whose section is sought.
  # @return [Capybara::Element] the found element.
  #
  def first_section(args)
    first_element('section', args)
  end

  # Find the first HTML table on the page matching the given arguments.
  #
  # @param args [String, Object] if passed a string, the text contained within the table sought; if passed an object, the object whose table is sought.
  # @return [Capybara::Element] the found element.
  #
  def first_table(args)
    first_element('table', args)
  end

  # Find the first HTML ul on the page matching the given arguments.
  #
  # @param args [String, Object] if passed a string, the text contained within the ul sought; if passed an object, the object whose ul is sought.
  # @return [Capybara::Element] the found element.
  #
  def first_unordered_list(args)
    first_element('ul', args)
  end

  # When scoped to an ol or ul, find the first HTML li on the page matching the given arguments.
  #
  # @param number [Integer] the nth li element sought.
  # @return [Capybara::Element] the found element.
  #
  def list_item_number(number)
    all('li')[number.to_i - 1]
  end

  # When scoped to a table, find the first HTML tr on the page matching the given arguments.
  #
  # @param number [Integer] the nth tr element sought 
  # @return [Capybara::Element] the found element.
  #
  def row_number(number)
    find('tbody').all('tr')[number.to_i - 1]
  end

  private

  # Find an element matching the given arguments
  #
  # @param tag [String] the HTML tag for the element
  # @param args [String] the text used to find the element
  # @param args [Object] the object used to find the element. Designed to work with the `content_tag_for` method in Rails, which creates an HTML element with the class and id parameters that relate to the specified Active Record object.
  #
  def find_element(tag, args)
    if String === args
      find(tag, text: args)
    else
      klass = args.class.to_s.downcase
      find("#{tag}##{klass}_#{args.id}", "#{tag}.#{klass}")
    end
  end

  # Find the first element on the page matching the given arguments.
  #
  # @param args [String, Object] if passed a string, the text contained within the element sought; if passed an object, the object whose element is sought.
  # @return [Capybara::Element] the found element.
  #
  def first_element(tag, args)
    if String === args
      first(tag, text: args)
    else
      klass = args.class.to_s.downcase
      first("#{tag}##{klass}_#{args.id}", "#{tag}.#{klass}")
    end
  end
end
