require 'rails_helper'

describe 'Trip Facade' do
  it 'can see a list of all trips by user' do
    road_trips = File.read('spec/fixtures/trips.json')
    stub_request(:get, 'http://localhost:3000/api/v1/1000/trips')
     .to_return(status: 200, body: road_trips, headers: {})

    trips = TripFacade.all_trips(1000)
    expect(trips).to be_an(Array)
  end
end
