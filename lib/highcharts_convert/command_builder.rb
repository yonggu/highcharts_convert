module HighchartsConvert
  class CommandBuilder
    InfileMissingError = Class.new(RuntimeError)
    ConstrForbiddenError = Class.new(RuntimeError)

    ALLOWED_CONSTR_VALUES = %w(Chart StockChart)

    def build(options = {})
      command = ["phantomjs highcharts-convert.js"]

      if options[:infile]
        command << "-infile #{options[:infile]}"
      else
        raise InfileMissingError.new("Infile must be specified")
      end

      command << "-outfile #{options[:outfile]}" if options[:outfile]
      command << "-scale #{options[:scale]}" if options[:scale]

      if options[:constr]
        validate_constr(options[:constr])
        command << "-constr #{options[:constr]}"
      end

      command << "-callback #{options[:callback]}" if options[:callback]

      command.join(" ")
    end

    private
    def validate_constr(constr)
      unless ALLOWED_CONSTR_VALUES.include?(constr)
        raise ConstrForbiddenError.new("constr can only be one of Chart or StockChart")
      end
    end
  end
end
