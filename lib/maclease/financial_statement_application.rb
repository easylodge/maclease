class Maclease::FinancialStatementApplication < Maclease::Base

  attr_accessor :application_type, :marital_status, :num_dependents, :co_borrower_rel

  CO_BORROWER_REL = %w(PARENT_CHILD OTHER)


  validate_reference_field(:co_borrower_rel)
end