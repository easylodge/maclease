class Maclease::Asset < Maclease::Base

  attr_accessor :asset_cost, :inventory_flag, :replacement_status, :year_of_manufacture, :motor_vehicle, :plant_and_equipment

  INVENTORY_FLAG = %w(YES NO)

  REPLACEMENT_STATUS = %w(ADDITIONAL REPLACEMENT)

  validate_reference_field(:inventory_flag)
  validate_reference_field(:replacement_status)
end
