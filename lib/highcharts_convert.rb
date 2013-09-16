require "highcharts_convert/version"
require "highcharts_convert/phantomjs"
require "highcharts_convert/outfile_builder"
require "highcharts_convert/command_builder"
require "highcharts_convert/service"

module HighchartsConvert
  def self.root
    File.expand_path '../..', __FILE__
  end
end
