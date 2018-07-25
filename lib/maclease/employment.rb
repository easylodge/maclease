class Maclease::Employment < Maclease::Base

  attr_accessor :abn, :business_num, :employer_contact_name, :employer_contact_phone, :employer_name, :business_activity
  attr_accessor :employment_type, :is_employer_proprietary, :occupation, :previous_employer_name, :previous_employer_phone
  attr_accessor :previous_years_employed, :previous_months_employed, :years_employed, :months_employed, :employer_address

  EMPLOYMENT_TYPE = %w(CASUAL_FULL_TIME CASUAL_PART_TIME  PERMANENT_FULL_TIME PERMANENT_PART_TIME SELF_EMPLOYED_CONTRACTOR PENSIONER SELF_FUNDED_RETIREE OTHER).freeze

  validate_reference_field(:employment_type)
end
