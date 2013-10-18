module CapybaraExtensions::Locators
  def image_locator(options)
    locator = String.new
    locator.concat "[@alt='#{options[:alt]}']" if options[:alt]
    locator.concat "[@src='#{options[:src]}']" if options[:src]
    locator
  end

  def meta_tag_locator(name, content)
    locator = String.new
    locator.concat "[@name='#{name}']"
    locator.concat "[@content='#{content}']"
    locator
  end
end
