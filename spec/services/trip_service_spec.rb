require 'rails_helper'

RSpec.describe TripService do
  describe 'returns a list of trips by uid' do
    it '#trips_by_uid', :vcr do

     info = TripService.trips_by_uid("1000")

      expect(info).to be_a(Hash)
      expect(info[:data][0]).to have_key(:id)
      expect(info[:data]).to be_an(Array)
      expect(info[:data][0][:attributes]).to have_key(:name)
    end
  end

  describe 'it returns a single trip' do
    it '.trip(uid, trip_id)', :vcr do

      trip_data = TripService.trip_by_id("1000", "4")

      expect(trip_data).to be_a(Hash)
      expect(trip_data).to have_key(:data)
      expect(trip_data[:data]).to have_key(:id)
      expect(trip_data[:data]).to have_key(:type)
      expect(trip_data[:data]).to have_key(:attributes)
        expect(trip_data[:data][:attributes]).to have_key(:uid)
        expect(trip_data[:data][:attributes]).to have_key(:name)
        expect(trip_data[:data][:attributes]).to have_key(:departure_date)
        expect(trip_data[:data][:attributes]).to have_key(:arrival_date)
      expect(trip_data[:data]).to have_key(:links)
      expect(trip_data[:data][:links]).to have_key(:self)
    end
  end

  describe 'it returns all stops by trip' do
    it 'all_stops', :vcr do

      all_stops = TripService.all_stops("1000", "6")

      expect(all_stops).to be_a(Hash)
      expect(all_stops).to have_key(:data)
      expect(all_stops[:data]).to be_an(Array)
    end
  end

  describe 'it returns addresses for stops' do
    it 'address', :vcr do

      address = TripService.address("1000", "6", "14", "15")

      expect(address).to be_a(Hash)
      expect(address).to have_key(:data)
      expect(address[:data]).to have_key(:id)
      expect(address[:data][:attributes]).to have_key(:location)
    end
  end
end
