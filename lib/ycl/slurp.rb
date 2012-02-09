module YCL

  # Given a directory, read each file into a mapping
  # with directories into a nested mapping.
  #
  class Command::SlurpCommand < Command

    def call(dir)
      hash = {}
      Dir.entries(dir).each do |path|
        next if path == '.' or path == '..'
        if File.directory?(path)
          hash[path] = slurp(path, opts)
        else
          text = File.read(path)
          hash[path] = YAML.load(text)  # any cases where this is not good idea?
        end
      end
    end

  end

end

