module HighchartsConvert
  class Phantomjs
    def self.installed?
      system "phantomjs -v"
    end
  end
end
