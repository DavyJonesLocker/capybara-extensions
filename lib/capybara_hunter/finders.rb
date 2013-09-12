module CapybaraHunter::Finders
  CapybaraHunter::FinderMethods += [:find_row, :find_table]
  def find_row(args)
    find_element('tr', args)
  end

  def find_table(args)
    find_element('table', args)
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
