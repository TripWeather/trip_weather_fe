require 'rails_helper'

describe 'TripsController' do
  describe 'Show Page' do
    it 'should show the information for one trip', :vcr do
      stub_omniauth

      road_trip = File.read('spec/fixtures/trip_by_id.json')

      stub_request(:get, 'http://localhost:3000/api/v1/1000/trips/1')
      .to_return(status: 200, body: road_trip, headers: {})

      trip = TripFacade.trip_by_id("1000", "1")
      #
      # top_trips = File.read('spec/fixtures/trips.json')
      #
      # stub_request(:get, 'http://localhost:3000/api/v1/1000/trips')
      # .to_return(status: 200, body: top_trips, headers: {})

      user = create(:omniauth_mock_user, google_id: '1000')

      visit '/'
      click_on "Log In"
      expect(current_path).to eq(dashboard_path)

      visit "/trips/#{trip.id}"

      expect(page).to have_content("test_trip")
      expect(page).to have_content("Arrival: Thursday, 10 Nov 2022 1:37 PM")
      expect(page).to have_content("Departure: Sunday, 06 Nov 2022 1:32 PM")
      expect(current_path).to eq("/trips/#{trip.id}")
    end

    it 'can delete a trip', :vcr do
      stub_omniauth

      road_trip = File.read('spec/fixtures/trip_by_id.json')

      stub_request(:get, 'http://localhost:3000/api/v1/1000/trips/1')
      .to_return(status: 200, body: road_trip, headers: {})

      trip = TripFacade.trip_by_id("1000", "1")
      user = create(:omniauth_mock_user, google_id: '1000')

      visit '/'
      click_on "Log In"
      expect(current_path).to eq(dashboard_path)

      visit "/trips/#{trip.id}"

      click_on "Delete Trip"

      expect(current_path).to eq('/trips')
      expect(page).to have_content("Trip has been Cancelled")
      expect(page).to_not have_content(trip.name)

    end
  end
  describe 'Stops' do
    it 'shows all the stops for trip', :vcr do
      stub_omniauth

      user = create(:omniauth_mock_user)

      visit '/'
      click_on "Log In"
      expect(current_path).to eq(dashboard_path)

      click_button "Create a New Trip"

      expect(current_path).to eq("/trips/new")

      fill_in :name, with: "Lovely Ad"
      fill_in :start_address, with: "123 N Santa Wy"
      fill_in :start_city, with: "Phoenix"
      select "AZ", from: :start_state
      fill_in :start_zipcode, with: "80012"

      fill_in :departure_date, with: '2022-11-30 15:00'

      fill_in :end_address, with: "123 N Santa Wy"
      fill_in :end_city, with: "Glendale"
      select "AZ", from: :end_state
      fill_in :end_zipcode, with: "84027"

      click_button "Create Trip"

      click_link 'Lovely Ad'

      expect(page).to have_content("123 N Santa Wy, Phoenix, AZ 80012")
      expect(page).to have_content("123 N Santa Wy, Glendale, AZ 84027")
    end
  end
end
