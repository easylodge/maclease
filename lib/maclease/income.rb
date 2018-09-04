class Maclease::Income < Maclease::Base

  attr_accessor :net_income_verification, :monthly_net_income, :gross_annual_income, :government_benefits, :superannuation
  attr_accessor :investment_property, :investment_income, :other_income, :spouse_gross_income, :spouse_net_income

  NET_INCOME_VERIFICATION = %w(PAYG OTHERS).freeze

  validate_reference_field(:net_income_verification)
end
