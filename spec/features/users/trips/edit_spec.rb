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

    click_button "Update Trip"

    expect(current_path).to eq("/trips/1")

    expect(page).to have_content("The Great Trip")
    expect(page).to_not have_content("Test_Trip")
    expect(page).to have_content("You've Updated Your Adventure")
  end
end
