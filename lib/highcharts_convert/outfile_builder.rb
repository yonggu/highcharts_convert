require 'pathname'
require 'securerandom'
require 'tmpdir'

module HighchartsConvert
  class OutfileBuilder
    OutfileExtensionForbiddenError = Class.new(RuntimeError)

    ALLOWED_OUTFILE_EXTENSIONS = %w(.jpg .png .pdf .svg)
    DEFAULT_OUTFILE_EXTENSION = ".png"

    def build(outfile = nil)
      if outfile
        validate_outfile_extension(outfile)
        Pathname.new(outfile).relative? ? File.join(Dir.tmpdir(), outfile) : outfile
      else
        File.join(Dir.tmpdir(), SecureRandom.uuid + DEFAULT_OUTFILE_EXTENSION)
      end
    end

    private
    def validate_outfile_extension(outfile)
      unless ALLOWED_OUTFILE_EXTENSIONS.include?(File.extname(outfile))
        raise OutfileExtensionForbiddenError.new("Must be a filename with the extension .jpg, .png, .pdf or .svg")
      end
    end
  end
end
