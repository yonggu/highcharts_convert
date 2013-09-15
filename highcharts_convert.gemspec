# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'highcharts_convert/version'

Gem::Specification.new do |spec|
  spec.name          = "highcharts_convert"
  spec.version       = HighchartsConvert::VERSION
  spec.authors       = ["Yong Gu"]
  spec.email         = ["zerogy921@gmail.com"]
  spec.description   = %q{It is a ruby wrapper for server side generation of charts by using PhantomJS}
  spec.summary       = %q{It is a ruby wrapper for server side generation of charts by using PhantomJS}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
