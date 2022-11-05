require 'rails_helper'

RSpec.describe "Login Users" do
  it 'can create a user' do
    stub_omniauth
    user = create(:omniauth_mock_user)
    visit '/'

    click_on "Log In"
    expect(current_path).to eq(dashboard_path)

    expect(current_path).to eq('/dashboard')
  end
end
