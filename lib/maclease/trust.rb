class Maclease::Trust < Maclease::Base

  attr_accessor :activity_purpose, :full_name, :marketing_excl_flag, :organisation_ABN, :organisation_type
  attr_accessor :trustee_business_name, :beneficiaries, :individual_trustee, :company_trustee


  ORGANISATION_TYPE = %w(FAMILY_TRUST TRADING_TRUST PROPERTY_TRUST).freeze

  validate_reference_field(:organisation_type)
end