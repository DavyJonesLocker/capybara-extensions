require 'capybara_hunter/version'
require 'test_helper'

module Capybara::Node::Finders
  def table(obj)
    if String === obj
      find('table', text: obj)
    elsif Hash === obj
      locator = build_locator_from_hash(obj.merge({locator: 'table'}))

      if obj.key? :content
        find(locator, text: obj[:content])
      else
        find(locator)
      end
    else
      hash = {}
      hash[:classes] = [obj.table_name]
      hash[:id] = "#{obj.table_name}_#{obj.id}"

      locator = build_locator_from_hash hash

      find(locator)
    end
  end

  # private

  def build_locator_from_hash(hash)
    locator = hash[:locator]
    if obj.key? :id
      locator = "#{locator}##{hash[:id]}"
    end

    if obj.key? :classes
      locator = "#{locator}.#{hash[:classes].join('.')}"
    end

    locator
  end

  # find row
  # find cell
end
