class Maclease::Quote < Maclease::Base

  attr_accessor :asset_cost, :asset_cost_gst, :asset_subtype, :basis, :origination_fee, :brokerage_value
  attr_accessor :brokerage_type, :cash_deposit, :direct_debit, :deferred_months, :effective_rate, :application_fee
  attr_accessor :finance_type, :fin_lodge_fee, :gst_on_insurance, :insurance, :condition, :num_of_assets
  attr_accessor :solve_for, :own_rate, :base_rate, :payment_frequency, :payout_amount, :residual_type, :residual_value
  attr_accessor :residual_mode, :sale_type, :contract_number, :state, :term, :trade_in, :campaign_code, :rate_exception

  BASIS = %w(ADVANCED ARREARS).freeze

  FINANCE_TYPE = %w(CONSUMER_LOAN CHATTEL_MORTGAGE NOVATED_LEASE).freeze

  CONDITION = %w(NEW USED DEMO)

  RESIDUAL_MODE = %w(SAVINGS TRADE_IN_OR_SELL REFINANCE OTHERS)

  SALE_TYPE = %w(DEALER_WITH_ABN PRIVATE_NO_ABN PRIVATE_WITH_ABN REFINANCE_MACQ REFINANCE_OTHER SALE_AND_BUYBACK PRIVATE_WITH_ABN_X_GST)

  validate_reference_field(:basis)
  validate_reference_field(:finance_type)
  validate_reference_field(:condition)
  validate_reference_field(:residual_mode)
  validate_reference_field(:sale_type)
end
