require 'rails_helper'

RSpec.describe "Login Users" do
  describe 'Navigate to create page' do
    it 'can create a user' do
      visit '/login'

      click_link "Log In"



      # fill_in :first_name, with: "Jill"
      # fill_in :last_name, with: "Scott"
      # fill_in :email, with: "j.scottie@yahoo.com"
      #
      # click_button "Submit"

      expect(current_path).to eq("/")
    end

  end
end
