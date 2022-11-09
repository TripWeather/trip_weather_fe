require 'rails_helper'

RSpec.describe 'Create a trip' do
  xit 'a user update stop', :vcr do
    stub_omniauth

    user = create(:omniauth_mock_user)

    visit '/'
    click_on "Log In"
    expect(current_path).to eq(dashboard_path)

    click_link "Test_Trip_3"
    within ".stops" do
      within "#stop-1" do
        expect(page).to have_content("Edit Address")
        click_link "Edit Address"
      end
    end

    expect(current_path).to eq "/trips/3/stops/5/addresses/5/edit"

    fill_in :address, with: "456 Claus Place"
    fill_in :city, with: "Birmingham"
    select "CO", from: :state
    fill_in :zipcode, with: "80012"

    click_button "Update Address"
    save_and_open_page
    expect(current_path).to eq "/trips/3"

    expect(page).to_not have_content("123 N Santa Wy")
    expect(page).to have_content("456 Claus Place")
    expect(page).to have_content("Birmingham")
    expect(page).to have_content("CO")
  end

end