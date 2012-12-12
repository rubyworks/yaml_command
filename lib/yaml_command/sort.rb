module YAML

  # Sort command. 
  #
  # Very limited at this point as it will only sort toplevel
  # sequence or mappings.
  #
  class Command::SortCommand < Command

    # Create files recursively?
    #attr_switch :save
    #alias_switch :s, :save

    # Select ordering, descending or ascending (default).
    # Use `descending` or `reverse` or abbreviations `d` or `r` for opposite order.
    attr_accessor :order
    alias_accessor :o, :order

    # Sort in ascending or descending order.
    def call(ypath=nil)
      if ypath
        raise NotImplementedError, "YPath not supported yet."
      end

      case data
      when Array
        new_data = data.sort
      when Hash
        new_data = {}
        data.keys.sort.each do |k|
          new_data[k] = data[k]
        end
      end

      #save
      output new_data
    end

  private

    def sort(list)
      case order
      when /^r/, /^d/  # reverse or descending
        list.sort.reverse
      else
        list.sort
      end
    end

  end

end
