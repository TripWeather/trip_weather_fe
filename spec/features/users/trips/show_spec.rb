require 'rails_helper'

describe 'TripsController' do
  describe 'Show Page', :vcr do
    it 'should show the information for one trip' do
      stub_omniauth

      user = create(:omniauth_mock_user, google_id: '1000')
      visit '/'
      click_on "Log In"
      expect(current_path).to eq(dashboard_path)

      click_button "Create a New Trip"

      expect(current_path).to eq("/trips/new")

      fill_in :name, with: "Stephen's Trip"
      fill_in :start_address, with: "2303 Braun Ct"
      fill_in :start_city, with: "Golden"
      select "CO", from: :start_state
      fill_in :start_zipcode, with: "80401"
      fill_in :departure_date, with: '2022-11-30 15:00'
      fill_in :end_address, with: "1823 Cedar Hill Dr"
      fill_in :end_city, with: "Royal Oak"
      select "MI", from: :end_state
      fill_in :end_zipcode, with: "48067"

      click_button "Create Trip"
      click_link "Stephen's Trip"
save_and_open_page
# need to get ride of comma between city and state
      expect(page).to have_content("Stephen's Trip")
      expect(page).to have_content("Start 2303 Braun Ct, Golden, CO 80401")
      expect(page).to have_content("End 1823 Cedar Hill Dr, Royal Oak, MI 48067")
      expect(page).to have_content("Arrival: Sunday, 10 Nov 2024 1:37 PM")
      expect(page).to have_content("Departure: Tuesday, 29 Nov 2022 1:00 PM")
      expect(current_path).to eq("/trips/4")
    end

    it 'can delete a trip' do
      stub_omniauth

      user = create(:omniauth_mock_user, google_id: '1000')

      visit '/'
      click_on "Log In"
      expect(current_path).to eq(dashboard_path)

      visit "/trips/7"

      click_on "Delete Trip"

      expect(current_path).to eq('/trips')
      expect(page).to have_content("Trip has been Cancelled")
      expect(page).to_not have_content("The Great Trip")

    end
  end
  describe 'Stops', :vcr do
    it 'shows all the stops for trip' do
      stub_omniauth

      user = create(:omniauth_mock_user)

      visit '/'
      click_on "Log In"
      expect(current_path).to eq(dashboard_path)

      visit "trips/1"
      # click_button "Create a New Trip"

      # expect(current_path).to eq("/trips/new")

      # fill_in :name, with: "Lovely"
      # fill_in :start_address, with: "123 N Santa Wy"
      # fill_in :start_city, with: "Phoenix"
      # select "AZ", from: :start_state
      # fill_in :start_zipcode, with: "80012"

      # fill_in :departure_date, with: '2022-11-30 15:00'

      # fill_in :end_address, with: "123 N Santa Wy"
      # fill_in :end_city, with: "Glendale"
      # select "AZ", from: :end_state
      # fill_in :end_zipcode, with: "84027"

      # click_button "Create Trip"

      # click_link 'Lovely'

      expect(page).to have_content("123 N Santa Wy, Phoenix, AZ 80012")
      expect(page).to have_content("123 N Santa Wy, Glendale, AZ 84027")
    end
  end
end
