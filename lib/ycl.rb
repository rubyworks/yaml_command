module YCL
  require 'yaml'
  require 'fileutils'
  require 'executable'
  require 'ycl/base'
  require 'ycl/get'
  require 'ycl/splat'
  require 'ycl/slurp'
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
