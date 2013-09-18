module CapybaraExtensions::Matchers
  CapybaraExtensions::ExtensionMethods += [:has_field_value?, :has_image?, :has_meta_tag?]

  def has_image?(options = {})
    raise "Must pass a hash with 'alt' or 'src'" unless options.is_a?(Hash) and (options.has_key?(:alt) or options.has_key?(:src))
    locator = String.new
    locator.concat "[@alt='#{options[:alt]}']" if options[:alt]
    locator.concat "[@src='#{options[:src]}']" if options[:src]
    has_selector?(:xpath, "//img#{locator}")
  end

  def has_field_value?(locator, options = {})
    raise "Must pass a hash containing 'with'" unless options.is_a?(Hash) and options.has_key?(:with)
    find_field(locator).value.must_equal options[:with]
  end

  def has_meta_tag?(name, content)
    has_selector?(:xpath, "/html/head/meta[@name='#{name}'][@content='#{content}']", visible: false)
  end

  def has_no_image?(options = {})
    raise "Must pass a hash with 'alt' or 'src'" unless options.is_a?(Hash) and (options.has_key?(:alt) or options.has_key?(:src))
    locator = String.new
    locator.concat "[@alt='#{options[:alt]}']" if options[:alt]
    locator.concat "[@src='#{options[:src]}']" if options[:src]
    has_no_selector?(:xpath, "//img#{locator}")
  end

  def has_no_meta_tag?(name, content)
    has_no_selector?(:xpath, "/html/head/meta[@name='#{name}'][@content='#{content}']", visible: false)
  end

  def has_no_field_value?(locator, options = {})
    raise "Must pass a hash containing 'with'" unless options.is_a?(Hash) and options.has_key?(:with)
    find_field(locator).value.wont_equal options[:with]
  end
end
