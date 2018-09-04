require 'maclease/version'
require 'maclease/origination'
require 'maclease/railtie' if defined?(Rails)
require 'maclease/configuration'
require 'maclease/base'
require 'maclease/address'
require 'maclease/applicant'
require 'maclease/asset'
require 'maclease/beneficial_owner'
require 'maclease/beneficiary'
require 'maclease/business_person'
require 'maclease/comment'
require 'maclease/company'
require 'maclease/document'
require 'maclease/employment'
require 'maclease/equipment'
require 'maclease/error'
require 'maclease/expense'
require 'maclease/financial_application'
require 'maclease/financial_statement'
require 'maclease/financial_statement_application'
require 'maclease/guarantor'
require 'maclease/income'
require 'maclease/individual'
require 'maclease/insurer'
require 'maclease/liability'
require 'maclease/partner'
require 'maclease/quotation'
require 'maclease/quote'
require 'maclease/special_asset'
require 'maclease/supplier'
require 'maclease/trust'
require 'maclease/vehicle'


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
