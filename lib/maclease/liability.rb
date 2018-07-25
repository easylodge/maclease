class Maclease::Liability < Maclease::Base

  attr_accessor :sequence, :type, :balance, :asset_sequence_link, :monthly_payment, :financier, :payout_flag, :end_date
  attr_accessor :limit_amount
end
