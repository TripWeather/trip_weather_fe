require 'rails_helper'

RSpec.describe 'Update a trip' do
  it 'trip update', :vcr do
    stub_omniauth
    user = create(:omniauth_mock_user)

    #create a new trip
    visit '/'
    click_on "Log In"
    click_button "Create a New Trip"

    fill_in :name, with: "The best Trip 2"
    fill_in :start_address, with: "123 N Santa Wy"
    fill_in :start_city, with: "Phoenix"
    select "AZ", from: :start_state
    fill_in :start_zipcode, with: "80012"

    fill_in :departure_date, with: '2022-12-11 15:00'

    fill_in :end_address, with: "123 N Santa Wy"
    fill_in :end_city, with: "Glendale"
    select "AZ", from: :end_state
    fill_in :end_zipcode, with: "84027"

    click_button "Create Trip"

    expect(current_path).to eq(trips_path)

    click_link "The best Trip 2"

    click_button "Update Trip"

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

    expect(page).to have_content("The Great Trip")
    expect(page).to_not have_content("The best Trip 2")
    expect(page).to have_content("You've Updated Your Adventure")
  end
end
