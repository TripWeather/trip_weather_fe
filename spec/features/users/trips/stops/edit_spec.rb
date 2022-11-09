require 'rails_helper'

RSpec.describe 'Create a trip' do
  it 'a user update stop', :vcr do
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

    fill_in :address, with: "200 E Colfax Ave"
    fill_in :city, with: "Denver"
    select "CO", from: :state
    fill_in :zipcode, with: "80203"

    click_button "Update Address"
    expect(current_path).to eq "/trips/3"

    expect(page).to_not have_content("456 Claus Place, Birmingham, CO 80012")
    expect(page).to have_content("200 E Colfax Ave, Denver, CO 80203")
  end

end