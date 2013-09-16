require 'fileutils'
require 'highcharts_convert/phantomjs'
require 'highcharts_convert/outfile_builder'
require 'highcharts_convert/command_builder'

module HighchartsConvert
  class Service
    PhantomjsMissingError = Class.new(RuntimeError)

    def initialize(*args)
      ensure_phantomjs_installed
      super(*args)
    end

    def export(infile, options = {})
      outfile = HighchartsConvert::OutfileBuilder.new.build(options[:outfile])
      command = HighchartsConvert::CommandBuilder.new.build(options.merge(infile: infile, outfile: outfile))
      FileUtils.cd(phantomjs_exporting_server_directory) do
        system command
      end
      outfile
    end

    private
    def phantomjs_exporting_server_directory
      File.join(HighchartsConvert.root, "lib", "exporting-server", "phantomjs")
    end

    def ensure_phantomjs_installed
      unless defined?(@phantomjs_installed)
        @phantomjs_installed = HighchartsConvert::Phantomjs.installed?
        unless @phantomjs_installed
          raise PhantomjsMissingError.new("You need a Java Runtime Environment to run the export server")
        end
      end
    end
  end
end
