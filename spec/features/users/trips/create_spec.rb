require 'rails_helper'

RSpec.describe 'Create a trip' do
  it 'a user can create' do
    stub_omniauth

    road_trips = File.read('spec/fixtures/trips.json')
    stub_request(:get, 'http://localhost:3000/api/v1/1000/trips')
    .to_return(status: 200, body: road_trips, headers: {})

    trips = TripFacade.all_trips("1000")

    user = create(:omniauth_mock_user)

    visit '/'
    click_on "Log In"
    expect(current_path).to eq(dashboard_path)

    click_button "Create a New Trip"

    expect(current_path).to eq("/trips/new")
save_and_open_page
    fill_in :name, with: "Grand Adventure"
    fill_in :start_address, with: "123 N Santa Wy"
    fill_in :city, with: "Phoenix"
    select "AZ", from: :state
    fill_in :zipcode, with: "80012"

    select "11/10/2022", from: :departure_date
    select "3:00pm", from: :departure_time

    fill_in :address, with: "123 N Santa Wy"
    fill_in :city, with: "Glendale"
    select "AZ", from: :state
    fill_in :zipcode, with: "84027"

    click_button "Create Trip"

    expect(current_path).to eq("/trips")

    expect(page).to have_content("Grand Adventure")
    expect(TripFacade.all_trips("1000").count).to eq 6
  end
end