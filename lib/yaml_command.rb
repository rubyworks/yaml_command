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

module YAML

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

=begin
  def main_options(options)
    OptionParser.new do |opt|
      opt.on('-f', '--file FILE') do |f|
        options[:file] = f
      end
      opt.on('-F', '--force') do
        options[:force] = true
      end
      opt.separator "OUTPUT FORMATS:"
      opt.on('-i', '--inspect') do
        options[:format] = :inspect
      end
      opt.on('-y', '--yaml') do
        options[:format] = :yaml
      end
      opt.on('-j', '--json') do
        options[:format] = :json
      end
      opt.on('-m', '--mute') do
        options[:format] = :mute
      end
      opt.on_tail('--help') do
        puts opt
        exit 0
      end
    end
=end