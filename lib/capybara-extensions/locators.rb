# Locators for xpath.
module CapybaraExtensions::Locators

  # Builds a locator via the given src or alt.
  #
  # @param options[Hash] must pass a hash containing src and/or alt to match against.
  # @return [String] string formatted for finding an attribute with xpath.
  #
  def image_locator(options)
    locator = String.new

    if options[:src]
      if Regexp === options[:src] && image = _find_image_with_regex(options[:src])
        locator.concat("[@src='#{image}']")
      else options[:src]
        locator.concat "[@src='#{options[:src]}']"
      end
    end

    locator.concat "[@alt='#{options[:alt]}']" if options[:alt]
    locator
  end

  # Builds a locator via the given name and content.
  #
  # @params name[String] the name of the meta tag sought.
  # @params content [String] the content of the meta tag sought.
  # @return [String] string formatted for finding a meta tag with xpath.
  #
  def meta_tag_locator(name, content)
    locator = String.new
    locator.concat "[@name='#{name}']"
    locator.concat "[@content='#{content}']"
    locator
  end

  private

  def _find_image_with_regex(src)
    all_images = all('img')
    all_images.each do |image|
      if image.native.attributes['src'].value.match(src).nil?
        return image.native.attributes['src'].value
      end
    end
    nil
  end
end
