module CapybaraHunter::Finders
  def find_row(args)
    find_element('tr', args)
  end

  def find_table(args)
    find_element('table', args)
  end

  private

  def find_element(tag, args)
    case args
    when String
      find(tag, text: args)
    when Hash
      args.stringify_keys!
      if args['class']
        tag = tag + ".#{args['class']}"
      end
      if args['id']
        tag = tag + "#{args['id']}"
      end
      find(tag)
    end
  end
end
