require 'rails_helper'

RSpec.describe "Users Show" do
  describe 'As a User' do
    before :each do
      stub_omniauth
      @user = create(:user)
    end

    xit 'I see my username and my image' do
      visit '/dashboard'

      expect(page).to have_content()
    end
  end
end
