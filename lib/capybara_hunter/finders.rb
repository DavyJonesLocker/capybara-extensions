module CapybaraHunter::Finders
  CapybaraHunter::FinderMethods += [:find_row, :find_table]

  def list_item(args)
    find_element('li', args)
  end

  def ordered_list(args)
    list_item = list_item(args)
    list_item.find(:xpath, 'ancestor::ol')
  end

  def unordered_list(args)
    list_item = list_item(args)
    list_item.find(:xpath, 'ancestor::ul')
  end

  def find_row(args)
    find_element('tr', args)
  end

  def find_table(args)
    if String === args
      find_element('table', args)
    else
      row = find_row(args)
      row.find(:xpath, 'ancestor::table')
    end
  end

  private

  def find_element(tag, args)
    if String === args
      find(tag, text: args)
    else
      klass = args.class.to_s.downcase
      find("#{tag}##{klass}_#{args.id}", "#{tag}.#{klass}")
    end
  end
end
