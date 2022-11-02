require 'rails_helper'

RSpec.describe "Login Users" do
  describe 'Navigate to create page' do
    it 'can create a user' do
      visit root_path

      click_link "Create Account"

      expect(current_path).to eq new_user_path

      fill_in :first_name, with: "Jill"
      fill_in :last_name, with: "Scott"
      fill_in :email, with: "j.scottie@yahoo.com"

      click_button "Submit"

      expect(current_path).to eq "/dashboard"
    end

  end
end