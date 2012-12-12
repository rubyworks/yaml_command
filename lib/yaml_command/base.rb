module YAML

  # Abstract base command that all others use.
  #
  class Command < Executable::Command

    #
    def self.command_name
      'yaml'
    end

    # Debug mode.
    def debug=(boolean)
      $DEBUG = boolean ? true : false
    end

    # Debug mode.
    def debug?
      $DEBUG
    end

    # Force file overwrites.
    attr_switch :force
    alias_switch :f, :force

    # YAML file to use as data source. 
    # This can be used as an alternative to `$stdin`.
    attr_accessor :file
    alias_accessor :F, :file

    # Output using Ruby's #inspect method.
    def inspect=(boolean)
      @format = :inspect if boolean
    end

    # Output using Ruby's #inspect method.
    def inspect?
      @format == :inspect
    end

    # Output using #to_yaml.
    def yaml=(boolean)
      @format = :yaml if boolean
    end

    # Output using #to_yaml.
    def yaml?
      @format == :yaml
    end

    alias_switch :y, :yaml

    # Output using #to_json.
    def json=(boolean)
      @format = :json if boolean
    end

    # Output using #to_json.
    def json?
      @format == :json
    end

    alias_switch :j, :json

    # Surpress all output.
    def mute?
      @format == :mute
    end

    # Surpress all output.
    def mute=(boolean)
      @format = :mute if boolean
    end

    alias_switch :m, :mute

    # Show detailed help message.
    def help!
      cli.show_help
      exit
    end

    # Show minimal help message.
    def h!
      puts cli
      exit
    end

    # YAML Command Language
    def call
      if file
        output(data)
      else
        puts cli
      end
    end

  #protected

    #
    def data=(data)
      @data = data
    end

  private

    attr_reader :format

    #
    def data
      @data ||= (
        if file
          YAML.load_file(file)
        else
          YAML.load($stdin)
        end
      )
    end

    #
    def output(result)
      case format
      when :yaml
        puts result.to_yaml
      when :json
        require 'json'
        puts result.to_json
      when :inspect
        puts result.inspect
      when :mute
        # no output
      else
        puts result
      end
    end

  end

end
