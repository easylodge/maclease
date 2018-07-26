class Maclease::Vehicle < Maclease::Base

  attr_accessor :body_type, :engine_num, :make, :model, :registration_num, :retail_value, :vin_chasis_num, :wholesale_value
  attr_accessor :nvic, :use_glasses_flag, :accessories

  BODY_TYPE = %w(4WD BUS CABRIOLET CARAVAN COUPE FORKLIFT HATCH LORRY MOBILEPLANT MOTORCYCLE PANELVAN PRIMEMOVER SEDAN SMALLBUS STATIONWAGON TRACTOR TRAILER UTILITY).freeze

  validate_reference_field(:body_type)
end
