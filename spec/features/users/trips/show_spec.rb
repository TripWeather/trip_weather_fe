require 'rails_helper'

describe 'TripsController' do
  describe 'Show Page', :vcr do
    it 'should show the information for one trip' do
      stub_omniauth

      user = create(:omniauth_mock_user)

      visit '/'
      click_on "Log In"
      expect(current_path).to eq(dashboard_path)

      visit "/trips/1"

      expect(page).to have_content("The Great Trip")
      expect(page).to have_content("Departure: Wednesday, 09 Nov 2022 9:25 PM")
      expect(page).to have_content("Arrival: Thursday, 10 Nov 2022 10:22 PM")
      expect(page).to have_content("Start 200 E Colfax Ave, Denver, CO 80203")
      expect(page).to have_content("End 1600 Pennsylvania Avenue NW, Washington, DC 20500")
    end
  end
end
