module YAML

  class Command::GetCommand < Command

    # Output an indexed value of a YAML document.
    def call(name)
      case data
      when Array
        value = data[name.to_i]
      else
        value = data[name] || data[name.to_sym]
      end

      output(
        case value
        when String, Numeric
          value
        when Date
          value.strftime('%Y-%m-%d')
        when Time
          value.strftime('%Y-%m-%d %H:%M:%S')
        else
          value.to_yaml
        end
      )
    end

  end

end
