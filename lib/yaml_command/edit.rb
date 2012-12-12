module YAMLCommand

  # Read a YAML file, open in default editor, validate and save.
  # If directory instead of a file, slurp together as temporary
  # YAML file and then re-splat to save.
  #
  class Command::EditCommand < Command

    TMP_FILE = ".tmp.yml"  # TODO: real tmpfile

    EDITOR = ENV['EDITOR'] || 'vi'

    # Edit a YAML file, or edit a directory via slurp and splt.
    def call(file_or_dir)
      if File.directory?(file_or_dir)
        data0 = Console.slurp(file_or_dir)
        File.open(TMP_FILE, 'w'){ |f| f << data0.to_yaml }
        edit_file(tmpfile)
        data1 = YAML.load_file(TMP_FILE)
        Console.splat(file_or_dir, :data=>data1)
      elsif File.file?(file_or_dir)
        edit_file(file_or_dir)
      else
        abort "does not exist"
      end
    end

    #
    def edit_file(file)
      success = system "#{EDITOR} #{file}"
      if success
        begin
          YAML.load_file(file)
        rescue
          edit_file(file)
        end
      end
    end

  end

end
