require 'rails_helper'

RSpec.describe "Dashboard page" do
  describe 'As a User' do
    before :each do
      stub_omniauth
      @user = create(:omniauth_mock_user)
      visit '/'

      click_link "Log In"
    end

    it 'I see my username and my image' do
      road_trips = File.read('spec/fixtures/trips.json')

      stub_request(:get, "http://localhost:3000/api/v1/#{@user.google_id}/trips")
       .to_return(status: 200, body: road_trips, headers: {})

      trips = TripFacade.all_trips("#{@user.google_id}")

      visit '/dashboard'


      expect(page).to have_content(@user.email)
      expect(page).to have_xpath("//img[contains(@src,'#{@user.image}')]")
    end
  end
end
