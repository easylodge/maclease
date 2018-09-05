class Maclease::FinancialApplication < Maclease::Base

  attr_accessor :privacy_disclosure, :applicants, :assets, :contract_type, :equipment_location, :quotation
  attr_accessor :financial_statement_application, :comment_texts, :asset_subtype, :finance_type, :suppliers
  attr_accessor :manual_insurers, :guarantors, :campaign_code, :foreseeable_changes, :marital_status, :num_dependents

  PRIVACY_DISCLOSURE = %w(YES NO)

  CONTRACT_TYPE = %w(STANDARD CREDIT_LIMIT MASTER_AGREEMENT MASTER_DRAWDOWN).freeze

  FINANCE_TYPE = %w(CONSUMER_LOAN CHATTEL_MORTGAGE NOVATED_LEASE).freeze

  MARITAL_STATUS = %w(SINGLE MARRIED DEFACTO)

  MANUAL_INSURERS = %w(LIFES_CARAVANS_&_CAMPERVANS_AU LIFES_MOTORCYCLES_&_SCOOTERS_AU LIFES_MOTORHOMES_AU MOTOV_CARS_-_OTHER_CARS_AU MOTOV_UTILITIES_&_VANS_AU)


  validate_reference_field(:privacy_disclosure)
  validate_reference_field(:marital_status)
  validate_reference_field(:contract_type)
  validate_reference_field(:finance_type)
  validate_reference_field(:manual_insurers)
end

