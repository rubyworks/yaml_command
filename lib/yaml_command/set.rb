module YAMLCommand

  class Command::SetCommand < Command

    # Set an indexed value of a YAML document.
    def call(name, value)
      name = yaml_value(name) if String === name
      new_value = yaml_value(value) if String === name

      case data
      when Array
        raise ArgumentError unless name.to_s =~ /d+/
        index = name.to_i
        old_value = data[index]
        data[index] = new_value
      when Hash
        if data.key?(name)
          key = name       
          old_value = data[name]
          data[name] = new_value
        elsif data.key?(name.to_sym)
          key = name.to_sym
          old_value = data[key]
          data[key] = new_value
        else
          old_value = nil
          data[name] = new_value
        end
      else
        raise NotImplementedError
      end

      if !old_value.eql?(new_value)
        #TODO: save
        output data
      end
    end

    #
    def yaml_value(value)
      YAML.load(value)
    end

  end

end
