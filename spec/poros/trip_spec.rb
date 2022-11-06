require 'rails_helper'

RSpec.describe Trip do
  before :each do
    fake_data =
    {
      id: "1",
      type: "trip",
      attributes: {
        uid: "1000",
        name: "test_trip",
        departure_date: "2022-11-06T13:32:59.000Z",
        arrival_date: "2022-11-10T13:37:38.000Z"
      },
      links: {
        self: "https://trip-weather-2022.herokuapp.com/api/v1/1000/trips/1"
      }
    }

    @trip = Trip.new(fake_data)
  end
  it 'exists and as attributes' do

    expect(@trip).to be_a(Trip)
    expect(@trip.id).to eq("1")
    expect(@trip.name).to eq("test_trip")
    expect(@trip.departure_date).to eq("2022-11-06T13:32:59.000Z")
    expect(@trip.arrival_date).to eq( "2022-11-10T13:37:38.000Z")
  end

  it 'converts date and times to standard format' do
    expect(@trip.standard_time("2022-11-10T13:37:38.000Z")).to eq("Thursday, 10 Nov 2022  1:37 PM")
  end
end
