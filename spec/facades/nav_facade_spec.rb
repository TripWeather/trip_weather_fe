require 'rails_helper'

RSpec.describe NavFacade, :vcr do
  context 'it takes nav service response and returns a nav object' do
    it '#create_nav_object' do
      start_address = "2303 Braun Ct, Golden CO, 80401"
      end_address = "1823 Cedar Hill Dr, Royal Oak, MI 48067"
      return_value = NavFacade.create_nav_object(start_address, end_address)

      expect(return_value).to be_a(Nav)
    end
  end
end