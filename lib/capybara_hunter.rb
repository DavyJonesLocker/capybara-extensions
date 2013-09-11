#require 'capybara_hunter/version'
#require 'test_helper'

module CapybaraHunter; end

require 'capybara_hunter/finders'

Capybara::Node::Base.send(:include, CapybaraHunter::Finders)
Capybara::Node::Simple.send(:include, CapybaraHunter::Finders)

#module Capybara::Node::Finders
  #ELEMENTS = { table: 'table', row: 'tr' }

  #ELEMENTS.each do |name, html|
    #define_method("find_#{name}") do |obj|
      #if String === obj
        #locator = [html, { text: obj }]
      #elsif Hash === obj
        #hash = obj.merge({ locator: html })
        #locator = build_locator_from_hash hash
        #if obj.key?(:content)
          #locator = [locator, { text: obj[:content] }]
        #end
        #locator
      #else
        #hash = { id: "#{obj.class.to_s.downcase}_#{obj.id}", class: obj.class.to_s.downcase }
        #locator = build_locator_from_hash hash
      #end
      #find(*locator)
    #end
  #end

  #private

  #def build_locator_from_hash(hash)
    #locator = hash[:locator]
    #locator = "#{locator}##{hash[:id]}" if hash.key? :id
    #locator = "#{locator}.#{hash[:class]}" if hash.key? :class
    #locator
  #end
#end
