require 'yaml'
require 'fileutils'
require 'executable'
require 'yaml_command/base'
require 'yaml_command/get'
require 'yaml_command/set'
require 'yaml_command/sort'
require 'yaml_command/splat'
require 'yaml_command/slurp'
require 'yaml_command/edit'
require 'yaml_command/view'

module YAMLCommand

  #
  module Console
    extend self

    #
    def slurp(dir, options={})
      slurp = SlurpCommand.new(options)
      slurp.call(dir)
    end

    #
    def splat(file, options={})
      splat = SplatCommand.new(options)
      splat.call(file)
    end

  end

  #
  def self.const_missing(name)
    index[name.to_s.downcase] || super(name)
  end

  #
  def self.index
    @index ||= begin
      file = File.dirname(__FILE__) + '/yaml_command.yml'
      YAML.load_file(file)
    rescue
      {}
    end
  end

end

