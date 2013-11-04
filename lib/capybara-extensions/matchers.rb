require_relative 'locators'

module CapybaraExtensions::Matchers
  include CapybaraExtensions::Locators
  CapybaraExtensions::ExtensionMethods.concat [:has_field_value?, :has_image?, :has_meta_tag?]

  # Checks that the current node has an image with the given src or alt.
  #
  # @param options [Hash] must pass a hash containing src and/or alt to match against.
  # @return [Boolean] true if the image matches.
  #
  def has_image?(options = {})
    raise "Must pass a hash containing 'src' or 'alt'" unless options.is_a?(Hash) && (options.has_key?(:src) || options.has_key?(:alt))
    has_selector?(:xpath, "//img#{image_locator(options)}")
  end

  # Checks that the current node does not have an image with the given src or alt.
  #
  # @param options [Hash] must pass a hash containing src and/or alt to match against.
  # @return [Boolean] true if the image does not match.
  #
  def has_no_image?(options = {})
    raise "Must pass a hash with 'alt' or 'src'" unless options.is_a?(Hash) and (options.has_key?(:alt) or options.has_key?(:src))
    has_no_selector?(:xpath, "//img#{image_locator(options)}")
  end

  # Checks that the value of a field matches a given value. Typically, you'll want to scope this to a form.
  #
  # @param locator [String] the label, name, or id of the field.
  # @param text [String] the text to match against the field value.
  # @return [Boolean] true if the field value matches.
  #
  def has_field_value?(locator, text)
    if find_field(locator).value == text
      true
    else
      raise Capybara::ExpectationNotMet, "expected to find field #{locator} with a value of #{text}."
    end
  end

  # Checks that the value of a field does not match a given value. Typically, you'll want to scope this to a form.
  #
  # @param locator [String] the label, name, or id of the field.
  # @param text [String] the text to match against the field value.
  # @return [Boolean] true if the field value does not match.
  #
  def has_no_field_value?(locator, text)
    if find_field(locator).value != text
      true
    else
      raise Capybara::ExpectationNotMet, "expected to not find field #{locator} with a value of #{text}."
    end
  end

  # Checks the that the content of a meta tag matches a given value.
  #
  # @param name [String] the name attribute of the meta tag.
  # @param content [String] the value of the content attribute to match against.
  # @return [Boolean] true if the meta tag content matches the name.
  #
  def has_meta_tag?(name, content)
    has_selector?(:xpath, "/html/head/meta#{meta_tag_locator(name, content)}", visible: false)
  end

  # Checks the that the content of a meta tag does not match a given value.
  #
  # @param name [String] the name attribute of the meta tag.
  # @param content [String] the value of the content attribute to match against.
  # @return [Boolean] true if the meta tag content does not match the name.
  #
  def has_no_meta_tag?(name, content)
    has_no_selector?(:xpath, "/html/head/meta#{meta_tag_locator(name, content)}", visible: false)
  end
end
