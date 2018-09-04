class Maclease::Individual < Maclease::Base

  attr_accessor :individual_applicant_type, :accountant_contact_name, :accountant_contact_phone, :accountant_firm_name
  attr_accessor :bo_flag, :title, :first_name, :middle_name, :surname, :other_name, :date_of_birth, :email, :email_unavailable_flag
  attr_accessor :fax, :licence_number, :licence_type, :license_state, :mobile, :telephone, :work_phone, :residential_status
  attr_accessor :landlord_name, :landlord_phone, :au_residency_status, :customer_number, :sole_trader, :guarantor_flag
  attr_accessor :employment, :same_applicant_addr, :address, :mailing_address, :previous_address, :marketing_excl_flag, :financial_statement

  INDIVIDUAL_APPLICANT_TYPE = %w(INDIVIDUAL NON_BORROWER_SPOUSE).freeze

  TITLE = %w(DR MRS MISS MR MS)

  SOLE_TRADER = %w(YES NO)

  LICENCE_TYPE = %w(FULL PROVISIONAL LEARNER HEAVY_VEHICLE NONE).freeze

  LICENCE_STATE = %w(NEW_SOUTH_WALES VICTORIA QUEENSLAND SOUTH_AUSTRALIA WESTERN_AUSTRALIA TASMANIA AUSTRALIAN_CAPITAL_TERRITORY NORTHERN_TERRITORY OVERSEAS).freeze

  RESIDENTIAL_STATUS = %w(OWN_PROPERTY OWN_MORTGAGED LIVING_WITH_RELATIVES BOARDING RENTING)

  AU_RESIDENCY_STATUS = %w(CITIZEN PERMANENT_RESIDENT VISA)


  validate_reference_field(:individual_applicant_type)
  validate_reference_field(:title)
  validate_reference_field(:licence_type)
  validate_reference_field(:licence_state)
  validate_reference_field(:au_residency_status)
  validate_reference_field(:residential_status)
  validate_reference_field(:sole_trader)
end