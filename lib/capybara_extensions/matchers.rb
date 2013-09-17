module CapybaraExtensions::Matchers
  CapybaraExtensions::MatcherMethods += [:must_have_input]

  def must_have_input(locator, options = {})
    raise "Must pass a hash containing 'with'" if not options.is_a?(Hash) or not options.has_key?(:with)
    find_field(locator).value.must_equal options[:with]
  end
end
