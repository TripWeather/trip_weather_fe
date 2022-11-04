require 'rails_helper'

RSpec.describe "Login Users" do
  it 'can create a user' do
    stub_omniauth
    user = create(:omniauth_mock_user)
    visit '/login'

    click_link "Log In with Google"

    expect(current_path).to eq('/dashboard')
  end
end
