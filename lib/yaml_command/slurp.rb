module YAMLCommand

  # Given a directory, read each file into a mapping
  # with directories into a nested mapping.
  #
  class Command::SlurpCommand < Command

    # Import each file of a directory into a YAML file.
    def slurp(dir)
      output slurp_directory(dir)
    end

    #
    alias_method :call, :slurp

    #
    def recurse?
      @recurse
    end

    #
    def recurse=(boolean)
      @recurse = boolean
    end

    alias_switch :r, :recurse

  private

    # Import each file of a directory into a YAML file.
    def slurp_directory(dir, hash={})
      Dir.entries(dir).each do |path|
        next if path == '.' or path == '..'
        local = File.join(dir, path)
        if File.directory?(local)
          if recurse?
            subhash = {}
            hash[path] = slurp_directory(local, subhash)
          end
        else
          text = File.read(local)
          hash[path] = YAML.load(text)  # any cases where this is not good idea?
        end
      end

      hash
    end

  end

end

