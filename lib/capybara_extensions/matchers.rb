module CapybaraExtensions::Matchers
  CapybaraExtensions::ExtensionMethods.concat [:has_field_value?, :has_image?, :has_meta_tag?]

  def has_image?(options = {})
    has_selector? :img, find_image(options)
  end

  def has_no_image?(options = {})
    # has_no_selector? :img, find_image(options)
    # return true if find_image(options) != true
    has_no_selector? :img, all_images(options)
  end

  def has_field_value?(locator, options = {})
    raise "Must pass a hash containing 'of'" unless options.is_a?(Hash) and options.has_key?(:of)
    find_field(locator).value.must_equal options[:of]
  end

  def has_meta_tag?(name, content)
    has_selector?(:xpath, "/html/head/meta[@name='#{name}'][@content='#{content}']", visible: false)
  end

  def has_no_meta_tag?(name, content)
    has_no_selector?(:xpath, "/html/head/meta[@name='#{name}'][@content='#{content}']", visible: false)
  end

  def has_no_field_value?(locator, options = {})
    raise "Must pass a hash containing 'with'" unless options.is_a?(Hash) and options.has_key?(:with)
    find_field(locator).value.wont_equal options[:with]
  end
end
