require 'rails_helper'

RSpec.describe TripService do
  describe 'returns a list of trips by uid' do
    it '#trips_by_uid' do

    road_trips = File.read('spec/fixtures/trips.json')
    stub_request(:get, 'http://localhost:3000/api/v1/1000/trips')
     .to_return(status: 200, body: road_trips, headers: {})
     # allow(TripService).to receive(:trips_by_uid).and_return(road_trips)
     info = TripService.trips_by_uid("1000")
      expect(info).to be_a(Hash)
      expect(info[:data][0]).to have_key(:id)
      expect(info[:data]).to be_an(Array)
      expect(info[:data][0][:attributes]).to have_key(:name)
    end
  end

  describe 'it returns a single trip' do
    it '.trip(uid, trip_id)' do
      road_trip = File.read('spec/fixtures/trip_by_id.json')
      stub_request(:get, 'http://localhost:3000/api/v1/1000/trips/1')
      .to_return(status: 200, body: road_trip, headers: {})

      trip_data = TripService.trip_by_id("1000", "1")

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
    xit 'all_stops' do
      road_trip = File.read('spec/fixtures/trip_by_id.json')
      stub_request(:get, 'http://localhost:3000/api/v1/1000/trips/1/stops')
      .to_return(status: 200, body: road_trip, headers: {})

      trip_data = TripService.trip_by_id("1000", "1")

      expect(stop_data).to be_a(Hash)
      expect(trip_data).to have_key(:data)
    end
  end
end
