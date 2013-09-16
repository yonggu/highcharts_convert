require 'spec_helper'

describe HighchartsConvert::OutfileBuilder do
  let(:builder) { HighchartsConvert::OutfileBuilder.new }
  let(:outfile) { "chart.png" }

  describe "#build" do
    it "builds a png file if outfile is not specified" do
      builder.build().end_with?(".png").should be_true
    end
    it "returns absolute pathname" do
      Pathname.new(builder.build()).absolute?.should be_true
    end
    it "raises error if outfile is not with the extension .jpg, .png, .pdf or .svg" do
      expect { builder.build("chart.gif") }.to raise_error("Must be a filename with the extension .jpg, .png, .pdf or .svg")
    end
  end
end
