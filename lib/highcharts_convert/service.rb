require 'fileutils'
require 'highcharts_convert/phantomjs'

module HighchartsConvert
  class Service
    PhantomjsMissingError = Class.new(RuntimeError)

    def initialize(*args)
      ensure_phantomjs_installed
      super(*args)
    end

    def export(infile, options = {})
      command = ["phantomjs highcharts-convert.js"]
      command << "-infile #{infile}"
      command << "-outfile #{options[:outfile]}" if options[:outfile]
      command << "-scale #{options[:scale]}" if options[:scale]
      command << "-constr #{options[:constr]}" if options[:constr]
      command << "-callback #{options[:callback]}" if options[:callback]

      FileUtils.cd(phantomjs_exporting_server_directory) do
        system command.join(" ")
      end
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
