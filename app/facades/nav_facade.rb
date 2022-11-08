class NavFacade < NavService

  def self.create_nav_object(start_address, end_address)
    nav_details_hash = nav(start_address, end_address)
    nav_attributes = nav_details_hash[:data][:attributes]
    require 'pry'; binding.pry
    Nav.new(nav_attributes)
  end
end