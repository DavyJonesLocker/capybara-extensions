module CapybaraHunter::Finders
  CapybaraHunter::FinderMethods += [:find_row, :find_table]

  def find_article(args)
    find_element('article', args)
  end

  alias_method :article, :find_article

  def find_paragraph(args)
    find_element('p', args)
  end

  alias_method :paragraph, :find_paragraph

  def find_row(args)
    find_element('tr', args)
  end

  alias_method :row, :find_row

  def find_table(args)
    if String === args
      find_element('table', args)
    else
      row = find_row(args)
      row.find(:xpath, 'ancestor::table')
    end
  end

  alias_method :table, :find_table

  def first_article(args)
    first_element('article', args)
  end

  def first_paragraph(args)
    first_element('p', args)
  end

  def first_row(args)
    first_element('tr', args)
  end

  def first_table(args)
    first_element('table', args)
  end

  def find_list_item(args)
    find_element('li', args)
  end

  alias_method :list_item, :find_list_item

  # must be scoped to an ol or ul
  def list_item_number(number)
    all('li')[number.to_i - 1]
  end

  def find_ordered_list(args)
    list_item = list_item(args)
    list_item.find(:xpath, 'ancestor::ol')
  end

  alias_method :ordered_list, :find_ordered_list

  def find_unordered_list(args)
    list_item = list_item(args)
    list_item.find(:xpath, 'ancestor::ul')
  end

  alias_method :unordered_list, :find_unordered_list

  # must be scoped to a table with a tbody
  def row_number(number)
    find('tbody').all('tr')[number.to_i - 1]
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

  def first_element(tag, args)
    if String === args
      first(tag, text: args)
    else
      klass = args.class.to_s.downcase
      first("#{tag}##{klass}_#{args.id}", "#{tag}.#{klass}")
    end
  end
end
