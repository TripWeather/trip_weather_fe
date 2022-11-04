require 'rails_helper'

RSpec.describe TripService do
  describe 'returns a list of trips by uid' do
    it '#trips_by_uid' do

    road_trips = File.read('spec/fixtures/trips.json')
    stub_request(:get, 'http://localhost:3000/api/v1/1000/trips')
     .to_return(status: 200, body: road_trips, headers: {})

     info = TripService.trips_by_uid("1000")
      expect(info).to be_a(Hash)
      expect(info[:data][0]).to have_key(:id)
      expect(info[:data]).to be_an(Array)
      expect(info[:data][0][:attributes]).to have_key(:name)
    end
  end
end
