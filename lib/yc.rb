module YC
  require 'yaml'
  require 'fileutils'
  require 'executable'
  require 'yc/base'
  require 'yc/get'
  require 'yc/set'
  require 'yc/sort'
  require 'yc/splat'
  require 'yc/slurp'
  require 'yc/edit'
  require 'yc/view'

  #
  module Console
    extend self

    #
    def slurp(dir, options={})
      slurp = Command::SlurpCommand.new(options)
      slurp.call(dir)
    end

    #
    def splat(file, options={})
      splat = Command::SplatCommand.new(options)
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
