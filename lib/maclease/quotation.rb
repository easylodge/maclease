class Maclease::Quotation < Maclease::Base

  attr_accessor :asset_cost, :asset_cost_gst, :asset_subtype, :basis, :origination_fee, :brokerage_value, :brokerage_type
  attr_accessor :cash_deposit, :direct_debit, :deferred_months, :effective_rate, :application_fee, :finance_type
  attr_accessor :fin_lodge_fee, :gross_payment, :gst_on_insurance, :insurance, :condition, :num_of_assets, :own_rate
  attr_accessor :payment_frequency, :payout_amount, :residual_type, :residual_value, :residual_mode, :sale_type
  attr_accessor :contract_number, :solve_for, :state, :term, :trade_in, :campaign_code, :rate_exception, :base_rate


  BASIS = %w(ADVANCED ARREARS).freeze

  CONDITION = %w(NEW USED DEMO).freeze

  PAYMENT_FREQUENCY = %w(FORTNIGHTLY MONTHLY QUATERLY SEMIANNUALLY ANNUALLY).freeze

  RESIDUAL_MODE = %w(SAVINGS TRADE_lN_OR_SELL REFINANCE OTHERS).freeze

  SALE_TYPE = %w(DEALER_WITH_ABN PRIVATE_NO_ABN PRIVATE_WITH_ABN REFINANCE_MACQ REFINANCE_OTHER SALE_AND_BUYBACK).freeze

  STATE = %w(NEW_SOUTH_WALES VICTORIA QUEENSLAND SOUTH_AUSTRALIA WESTERN_AUSTRALIA TASMANIA AUSTRALIAN_CAPITAL_TERRITORY NORTHERN_TERRITORY).freeze

  RATE_EXCEPTION = %w(NONE REFER PROMOTION).freeze

  validate_reference_field(:basis)
  validate_reference_field(:condition)
  validate_reference_field(:payment_frequency)
  validate_reference_field(:residual_mode)
  validate_reference_field(:sale_type)
  validate_reference_field(:state)
  validate_reference_field(:rate_exception)
end
