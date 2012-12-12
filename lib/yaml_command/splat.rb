module YAML

  # Writes each entry of a YAML hash to a file.
  # This is the opposite of #slurp.
  #
  class Command::SplatCommand < Command

    # Create files recursively?
    attr_switch :recurse
    alias_switch :r, :recurse

    # Dryrun mode.
    attr_switch :dryrun
    alias_switch :D, :dryrun

    # Splat a YAML mapping document into a directory of files.
    # One file is created for each mapping key.
    def call(dir=nil)
      raise 'not a mapping' unless Hash === data

      dir ||= file.chomp('.yaml').chomp('.yml')

      old_map = build_old_map(dir)
      new_map = build_new_map(dir)

      # TODO: get a list of keys that will actually change

      remove = (old_map.keys - new_map.keys).sort

      if dryrun?
        save_dryrun(remove, new_map.keys)
        return
      end

      unless remove.empty? or force?
        $stderr.puts "This operation will remove:"
        remove.each do |f|
          $stderr.puts "  #{f}"
        end
        $stderr.puts "Use -f/--force option to proceed."
        return
      end

      remove.each do |f|
        FileUtils.rm_r(f) if File.exist?(f)
      end

      new_map.each do |f,v|
        if v != old_map[f]
          d = File.dirname(f)
          FileUtils.mkdir_p(d) unless File.directory?(d)
          File.open(f, 'w'){ |f| f << v }
        end
      end

      nil
    end

  private

    #
    def save_dryun(remove, write)
      $stderr.puts "[DRYRUN]"
      remove.each do |f|
        $stderr.puts "  (remove)  #{f}"
      end

      write.each do |f|
        $stderr.puts "  (write)   #{f}"
      end
    end

    #
    def build_new_map(dir, data=nil)
      map = {}
      data ||= data()
      data.each do |k,v|
        if Hash === v && recurse?
          sub_map = build_new_map(File.join(dir, k), v)
          map.update(sub_map)
        else
          value = render_value(v)
        end
        map[File.join(dir,k)] = value
      end
      map
    end

    #
    def build_old_map(dir)
      return {} unless File.directory?(dir)

      map = {}
      entries = Dir.entries(dir) - ['.', '..']
      entries.each do |e|
        k = File.join(dir, e)
        if File.directory?(k)
          if recurse?
            value = build_old_map(File.join(dir, k))
            map[k] = value
          end
        else
          v = File.read(k)
          value = render_value(v)
          map[k] = value
        end
      end
      map     
    end

    #
    def render_value(value)
      case value
      when Hash
        txt = value.to_yaml
      when String, Numeric
        txt = value.to_s
      when Date
        txt = value.strftime('%Y-%m-%d')
      when Time
        txt = value.strftime('%Y-%m-%d %H:%M:%S')
      else
        txt = value.to_yaml
      end
      txt
    end

  end

end
