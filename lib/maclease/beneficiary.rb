class Maclease::Beneficiary < Maclease::Base

  attr_accessor :beneficiary_type, :name

  BENEFICIARY_TYPE = %w(CLASS INDIVIDUAL).freeze

  validate_reference_field(:beneficiary_type)
end
