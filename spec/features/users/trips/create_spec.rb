require 'rails_helper'

RSpec.describe 'Create a trip' do
  it 'a user can create', :vcr do
    stub_omniauth

    # road_trips = File.read('spec/fixtures/trips.json')
    # stub_request(:get, 'http://localhost:3000/api/v1/1000/trips')
    # .to_return(status: 200, body: road_trips, headers: {})
    #
    # trips = TripFacade.all_trips("1000")

    user = create(:omniauth_mock_user)

    visit '/'
    click_on "Log In"
    expect(current_path).to eq(dashboard_path)

    click_button "Create a New Trip"

    expect(current_path).to eq("/trips/new")

    fill_in :name, with: "Grand Adventure"
    fill_in :start_address, with: "123 N Santa Wy"
    fill_in :start_city, with: "Phoenix"
    select "AZ", from: :start_state
    fill_in :start_zipcode, with: "80012"

    fill_in :departure_date, with: '2022-11-30 15:00'

    fill_in :end_address, with: "123 N Santa Wy"
    fill_in :end_city, with: "Glendale"
    select "AZ", from: :end_state
    fill_in :end_zipcode, with: "84027"

    # new_trip = File.read('spec/fixtures/create_trip.json')
    # stub_request(:post, 'http://localhost:3000/api/v1/1000/trips?arrival_date=2024-11-10T13:37:38.000Z&departure_date=2022-11-30%20
    #   15:00&name=Grand%20Adventure')
    #   .to_return(status: 200, body: new_trip, headers: {})

    click_button "Create Trip"

    expect(current_path).to eq("/trips")

    expect(page).to have_content("Grand Adventure")
    expect(page).to have_content("You've Created a New Adventure!")
    # expect(TripFacade.all_trips("1000").count).to eq 6

  end
end
