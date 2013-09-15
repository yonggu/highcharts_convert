# HighchartsConvert

It is a ruby wrapper for server side generation of charts by using PhantomJS 

## Prerequisites

Install PhantomJS: http://http://phantomjs.org/

## Installation

Add this line to your application's Gemfile:

    gem 'highcharts_convert'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install highcharts_convert

## Usage

service = HighchartsConvert::Service.new
service.export input.json

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
