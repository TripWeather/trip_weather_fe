require 'rails_helper'

describe 'Trip Facade', :vcr do
  it 'can see a list of all trips by user' do
    trips = TripFacade.all_trips("1000")

    expect(trips).to be_an(Array)
    expect(trips).to all(be_a Trip)
  end

  it 'returns a single trip' do
     trip = TripFacade.trip_by_id("1000", "1")

    expect(trip).to be_a(Trip)
  end
end
