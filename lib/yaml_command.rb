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

end

