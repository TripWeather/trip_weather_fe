require 'rails_helper'

describe 'Users trips', :vcr do
  it 'should show the information for all trips' do
    stub_omniauth

    user = create(:omniauth_mock_user)

    visit '/'
    click_on "Log In"
    expect(current_path).to eq(dashboard_path)

    save_and_open_page
    expect(page).to have_content("Test_Trip")
    expect(page).to have_content("Test_Trip_2")
    expect(page).to have_content("Test_Trip_3")
    expect(page).to_not have_content("Test_Trip_4")

  end
end
