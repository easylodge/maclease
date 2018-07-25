class Maclease::Address < Maclease::Base

  attr_accessor :address_1, :address_2, :address_3, :postcode, :state, :years_at_address, :months_at_address

  STATE = %w(NEW_SOUTH_WALES VICTORIA QUEENSLAND SOUTH_AUSTRALIA WESTERN_AUSTRALIA TASMANIA AUSTRALIAN_CAPITAL_TERRITORY NORTHERN_TERRITORY).freeze

  validate_reference_field(:state)
end
