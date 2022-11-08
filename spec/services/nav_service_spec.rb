require 'rails_helper'

RSpec.describe NavService, :vcr do
  context '#nav' do
    it 'connects to BE Nav endpoint and returns hash of navigation data' do
      start_address = "2303 Braun Ct, Golden CO, 80401"
      end_address = "1823 Cedar Hill Dr, Royal Oak, MI 48067"

      return_value = NavService.nav(start_address, end_address)
    
      expect(return_value[:data]).to have_key(:id)
      expect(return_value[:data][:id]).to be_a(String)
      expect(return_value[:data][:attributes]).to have_key(:turn_by_turn_directions)
      expect(return_value[:data][:attributes][:turn_by_turn_directions]).to be_an(Array)
      expect(return_value[:data][:attributes]).to have_key(:total_trip_time)
      expect(return_value[:data][:attributes][:total_trip_time]).to be_a(Integer)
      expect(return_value[:data][:attributes]).to have_key(:total_distance)
      expect(return_value[:data][:attributes][:total_distance]).to be_a(Float)
      expect(return_value[:data][:attributes]).to have_key(:has_toll_road)
      expect(return_value[:data][:attributes][:has_toll_road]).to eq(true || false)
    end
  end
end