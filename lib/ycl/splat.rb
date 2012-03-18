module YCL

  # Writes each entry of a YAML hash to a file.
  # This is the opposite of #slurp.
  #
  class Command::SplatCommand < Command

    # Create files recursively?
    attr_switch :recurse

    # Splat a YAML mapping document into a directory of files.
    # One file is created for each mapping key.
    #
    def call(dir=Dir.pwd)
      #data.each do |n,v|
      #  fname = File.join(dir, n)
      #  if File.exist?(fname)
      #    raise "File exists. Use -F option to overwrite -- #{fname}" unless force?
      #  end
      #end

      FileUtils.mkdir_p(dir) unless File.directory?(dir)

      data.each do |n,v|
        fname = File.join(dir, n)
        case v
        when Hash
          if recurse?
            Console.splat(fname, :data=>v)
            txt = nil  # this prevents nil form writing file, good idea?
          else
            txt = v.to_yaml
          end
        when String, Numeric
          txt = v
        when Date
          txt = v.strftime('%Y-%m-%d')
        when Time
          txt = v.strftime('%Y-%m-%d %H:%M:%S')
        else
          txt = v.to_yaml
        end
        File.open(fname, 'w'){ |f| f << txt } if txt
      end

      nil
    end

  end

end
