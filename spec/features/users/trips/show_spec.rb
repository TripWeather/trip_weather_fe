require 'rails_helper'

describe 'User::TripsController' do
  describe 'Show Page' do
    it 'should show the information for one trip' do
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
    
      expect(page).to have_content("test_trip")
      expect(page).to have_content("Arrival: Thursday, 10 Nov 2022 1:37 PM")
      expect(page).to have_content("Departure: Sunday, 06 Nov 2022 1:32 PM")

    end
  end
end
