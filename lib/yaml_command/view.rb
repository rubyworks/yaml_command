module YAMLCommand

  # TODO: View could use a better implementation, it is very simplistic
  #       at this point.

  # TODO: Color coordinate matching achors and references.

  # TODO: Should view make a YAML stream if given multiple files ?


  # Display YAML file with color highlighting.
  #
  # This command requires the ANSI gem be installed.
  #
  class Command::ViewCommand < Command

    #
    # Invoke view command.
    #
    def call(path=nil)
      require 'ansi'

      colon = ":".ansi(:magenta)

      if path
        text = File.read(path)
      else
        if file
          text = File.read(file)
        else
          text = $stdin.read
        end
      end

      # Make sure it is valid YAML.
      YAML.load(text)

      text.each_line do |line|
        case line
        when /^---/
          print line
        when /^(\s*\-)(.*?)$/
          puts "%s%s" % [$1.ansi(:magenta), $2]
        when /^(\s*\w+)\:(.*?)$/
          puts "%s%s%s" % [$1.ansi(:cyan), colon, $2]
        else
          print line
        end
      end
    end

  end

end
