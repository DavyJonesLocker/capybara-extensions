require_relative 'locators'

module CapybaraExtensions::Matchers
  include CapybaraExtensions::Locators
  CapybaraExtensions::ExtensionMethods.concat [:has_field_value?, :has_image?, :has_meta_tag?]

  # images
  def has_image?(options = {})
    raise "Must pass a hash containing 'src' or 'alt'" unless options.is_a?(Hash) && (options.has_key?(:src) || options.has_key?(:alt))
    has_selector?(:xpath, "//img#{image_locator(options)}")
  end

  def has_no_image?(options = {})
    raise "Must pass a hash with 'alt' or 'src'" unless options.is_a?(Hash) and (options.has_key?(:alt) or options.has_key?(:src))
    has_no_selector?(:xpath, "//img#{image_locator(options)}")
  end

  #field values
  def has_field_value?(locator, options = {})
    raise "Must pass a hash containing 'of'" unless options.is_a?(Hash) and options.has_key?(:of)
    synchronize do
      unless Capybara::Helpers.normalize_whitespace(text).match(Capybara::Helpers.to_regexp(options[:of]))
        raise Capybara::ExpectationNotMet
      end
    end
    return true
  rescue Capybara::ExpectationNotMet
    return false
  end

  def has_no_field_value?(locator, options = {})
    raise "Must pass a hash containing 'of'" unless options.is_a?(Hash) and options.has_key?(:of)
    !has_field_value?(locator, options)
  end

  # meta tags
  def has_meta_tag?(name, content)
    has_selector?(:xpath, "/html/head/meta#{meta_tag_locator(name, content)}", visible: false)
  end

  def has_no_meta_tag?(name, content)
    has_no_selector?(:xpath, "/html/head/meta#{meta_tag_locator(name, content)}", visible: false)
  end
end
