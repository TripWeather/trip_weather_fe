require 'rails_helper'

RSpec.describe "Dashboard page" do
  describe 'As a User' do
    before :each do
      stub_omniauth
      @user = create(:omniauth_mock_user)
      visit '/login'

      click_link "Log In with Google"
    end

    it 'I see my username and my image' do

      visit '/dashboard'

      expect(page).to have_content(@user.email)
      expect(page).to have_xpath("//img[contains(@src,'#{@user.image}')]")
    end
  end
end
