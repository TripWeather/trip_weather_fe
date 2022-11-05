require 'rails_helper'

describe 'Users trips' do
  it 'should show the information for all trips' do
    stub_omniauth

    road_trips = File.read('spec/fixtures/trips.json')
    stub_request(:get, 'http://localhost:3000/api/v1/1000/trips')
    .to_return(status: 200, body: road_trips, headers: {})

    trips = TripFacade.all_trips("1000")

    user = create(:omniauth_mock_user)

    visit '/'
    click_on "Log In"
    expect(current_path).to eq(dashboard_path)

    click_button "All Trips"
  
    expect(page).to have_content("test_trip")
    expect(page).to have_content("test_trip_2")
    expect(page).to have_content("test_trip_3")
    expect(page).to have_content("test_trip_4")

    expect(current_path).to eq("/trips")
  end
end