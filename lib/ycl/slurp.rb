module YCL

  # Given a directory, read each file into a mapping
  # with directories into a nested mapping.
  #
  class Command::SlurpCommand < Command

    #
    def slurp(dir)
      hash = {}
      Dir.entries(dir).each do |path|
        next if path == '.' or path == '..'
        local = File.join(dir, path)
        if File.directory?(local)
          hash[path] = slurp(local)
        else
          text = File.read(local)
          hash[path] = YAML.load(text)  # any cases where this is not good idea?
        end
      end
      hash
    end

    #
    alias_method :call, :slurp

  end

end

