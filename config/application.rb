require File.expand_path('../boot', __FILE__)

require "active_record"
require 'active_support/core_ext'
require 'active_support/dependencies'
require 'erb'

module Integration
  class App
    cattr_accessor :dir
    @@dir = File.dirname(File.absolute_path(__FILE__)) + '/..'
    VERSION = '0.01'
    APP_NAME = 'Pingifes-SIG Integration'

    def do_require(f)
      if f =~ /example/
        @logger.debug "Ignoring #{f}, cause it's an example..."
        return
      end
      @logger.debug "Requiring #{f}..."
      require f
    end

    def dir
      self.class.dir
    end

    def initialize
      require "#{dir}/config/logger_factory.rb"
      @logger = LoggerFactory.build

      ["lib", "config/initializers"].each do |d|
        Dir["#{dir}/#{d}/*.rb"].each {|f| do_require f }
      end
      ["app/helpers", "app/models/remote/concerns", "app"].each do |d|
        Dir["#{dir}/#{d}/**/*.rb"].each {|f| do_require f }
      end
    end
  end
end

Integration::App.new
