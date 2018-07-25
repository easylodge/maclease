class Maclease::Company < Maclease::Base

  attr_accessor :accountant_contact_name, :accountant_contact_phone, :accountant_firm_name, :abn, :business_num, :exchange_name
  attr_accessor :fax, :industry, :is_postal_rba, :is_ppb_rba, :is_proprietary_company, :marketing_excl_flag, :name
  attr_accessor :full_name, :parent_name, :telephone, :customer_number, :address, :postal_address, :ppb_address
  attr_accessor :years_established, :business_persons, :beneficial_owners

end
