require 'capybara_hunter/version'
require 'test_helper'

module Capybara::Node::Finders
  def table(obj)
    if String === obj
      find('table', text: obj)
    elsif Hash === obj
      locator = build_locator_from_hash(obj.merge({locator: 'table'}))
      if obj.key?(:content)
        find(locator, text: obj[:content])
      else
        find(locator)
      end
    else
      hash = { id: "#{obj.class.to_s.downcase}_#{obj.id}", class: obj.class.to_s.downcase }
      locator = build_locator_from_hash hash
      find(locator)
    end
  end

  def row(obj)
    if String === obj
      locator = ['tr', { text: obj }]
    elsif Hash === obj
      hash = obj.merge({ locator: 'tr' })
      locator = build_locator_from_hash hash
      if obj.key?(:content)
        locator = [locator, { text: obj[:content] }]
      end
      locator
    else
      hash = { id: "#{obj.class.to_s.downcase}_#{obj.id}", class: obj.class.to_s.downcase }
      locator = build_locator_from_hash hash
    end
  end

  private

  def build_locator_from_hash(hash)
    locator = hash[:locator]
    locator = "#{locator}##{hash[:id]}" if hash.key? :id
    locator = "#{locator}.#{hash[:class]}" if hash.key? :class
    locator
  end

  # find row
  # find cell
end
