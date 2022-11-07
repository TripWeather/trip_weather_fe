require 'rails_helper'

RSpec.describe 'Update a trip' do
  it 'trip update', :vcr do
    stub_omniauth

    road_trip = File.read('spec/fixtures/trip_by_id.json')

    stub_request(:get, 'http://localhost:3000/api/v1/1000/trips/1')
    .to_return(status: 200, body: road_trip, headers: {})

    trip = TripFacade.trip_by_id("1000", "6")

    user = create(:omniauth_mock_user)

    visit '/'
    click_on "Log In"
    expect(current_path).to eq(dashboard_path)

    visit "/trips/#{trip.id}"
    click_button "Update Trip"

    expect(current_path).to eq("/trips/#{trip.id}/edit")

    fill_in :name, with: "The Great Trip"
    fill_in :start_address, with: "123 N Santa Wy"
    fill_in :start_city, with: "Phoenix"
    select "AZ", from: :start_state
    fill_in :start_zipcode, with: "80012"
    fill_in :departure_date, with: '2022-11-29 13:00'
    fill_in :end_address, with: "123 N Santa Wy"
    fill_in :end_city, with: "Glendale"
    select "AZ", from: :end_state
    fill_in :end_zipcode, with: "84027"

    click_button "Update Trip"

    expect(current_path).to eq("/trips/#{trip.id}")

    expect(page).to have_content("The Great Trip")
    expect(page).to_not have_content("Grand Adventure")
    expect(page).to have_content("You've updated #{trip.name}!")
  end
end
