require 'rails_helper'

RSpec.describe "Login Users" do
  xit 'can create a user' do
    visit '/login'
    save_and_open_page
    click_link "Log In with Google"

    expect(current_path).to eq('/auth/google_oauth2')
  end
end
