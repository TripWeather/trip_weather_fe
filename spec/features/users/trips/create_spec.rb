require 'rails_helper'

RSpec.describe 'Create and Delete a trip', :vcr do
  before :each do

    stub_omniauth

    @user = create(:omniauth_mock_user)

    visit '/'
    click_on "Log In"
    expect(current_path).to eq(dashboard_path)
  end

  describe 'creation' do
    it 'a user can create' do

      click_button "Create a New Trip"

      expect(current_path).to eq("/trips/new")

      fill_in :name, with: "Mega Adventure"
      fill_in :start_address, with: "2303 Braun Ct"
      fill_in :start_city, with: "Golden"
      select "CO", from: :start_state
      fill_in :start_zipcode, with: "80401"

      fill_in :departure_date, with: '2022-11-30 15:00'

      fill_in :end_address, with: "1823 Cedar Hill"
      fill_in :end_city, with: "Royal Oak"
      select "MI", from: :end_state
      fill_in :end_zipcode, with: "48067"


      click_button "Create Trip"

      expect(current_path).to eq("/trips")

      expect(page).to have_content("Mega Adventure")
      expect(page).to have_content("You've Created a New Adventure!")
    end
  end

  describe 'deletion' do
    it 'can delete a trip' do
      visit '/trips/8'

      click_on "Delete Trip"

      expect(current_path).to eq('/trips')

      expect(page).to_not have_content("Mega Adventure")
      expect(page).to have_content("Trip has been Cancelled")
    end
  end
end
