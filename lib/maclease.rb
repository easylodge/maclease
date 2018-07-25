require 'maclease/version'
require 'maclease/origination'
require 'maclease/railtie' if defined?(Rails)
require 'maclease/configuration'
require 'interfi_capital/dto' #this will include all sub-modules and classes we need

module Maclease
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
