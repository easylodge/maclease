class Maclease::Expense < Maclease::Base

  attr_accessor :monthly_rent_board, :general_living, :household_reason, :all_household_expenses_declared, :vehicle_running_cost
  attr_accessor :all_vehicle_cost_declared, :private_education_childcare, :other_expenses, :spouse_no_additional_expense_flag
  attr_accessor :all_liabilities_disclosed


  HOUSEHOLD_REASON =%w(LIVING_WITH_FAMILY SENIOR_CITIZEN PRE_TAX_AMOUNT RURAL_RESIDENCE OTHER)


  validate_reference_field(:household_reason)
end
