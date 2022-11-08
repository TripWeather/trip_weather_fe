require 'rails_helper'

RSpec.describe 'Update a trip', :vcr do
  it 'can update a trip' do
    stub_omniauth

    user = create(:omniauth_mock_user)

    visit '/'
    click_on "Log In"
    expect(current_path).to eq(dashboard_path)

    visit "/trips/1"
    click_button "Update Trip"

    expect(current_path).to eq("/trips/1/edit")

    fill_in :name, with: "The Great Trip"
    fill_in :start_address, with: "1600 Pennsylvania Ave NW"
    fill_in :start_city, with: "Washington"
    select "DC", from: :start_state
    fill_in :start_zipcode, with: "80012"
    fill_in :departure_date, with: '2022-11-29 13:00'
    fill_in :end_address, with: "350 State St"
    fill_in :end_city, with: "Salt Lake City"
    select "UT", from: :end_state
    fill_in :end_zipcode, with: "84103"

    click_button "Update Trip"

    expect(current_path).to eq("/trips/1")

    expect(page).to have_content("The Great Trip")
    expect(page).to_not have_content("Test_Trip")
    expect(page).to have_content("You've Updated Your Adventure")
  end
end
