require 'spec_helper'

describe HighchartsConvert::CommandBuilder do
  let(:builder) { HighchartsConvert::CommandBuilder.new }
  let(:options) { { infile: "data.json", outfile: "chart.png", scale: 2 } }
  describe "#build" do
    it "returns correct value" do
      builder.build(options).should == "phantomjs highcharts-convert.js -infile data.json -outfile chart.png -scale 2"
    end
    it "raises error if infile is missing" do
      options.merge!(infile: nil)
      expect { builder.build(options) }.to raise_error("Infile must be specified")
    end
    it "raises error if constr is specified but not one of Chart of StockChart" do
      options.merge!(constr: "Test")
      expect { builder.build(options) }.to raise_error("constr can only be one of Chart or StockChart")
    end
  end
end
