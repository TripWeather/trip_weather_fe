require 'rails_helper'

RSpec.describe WeatherService, :vcr do 
  it 'calls to BE weather endpoint, and gets weather response' do
    address = "1823 Cedar Hill Dr, Royal Oak MI 48067"
    return_value = WeatherService.weather(address)

    expect(return_value[:data]).to have_key(:attributes)
    expect(return_value[:data][:attributes]).to have_key(:name)
    expect(return_value[:data][:attributes]).to have_key(:temperature)
    expect(return_value[:data][:attributes]).to have_key(:short_forecast)
    expect(return_value[:data][:attributes]).to have_key(:detailed_forecast)
  end

  it 'calls to BE weather endpoint, and gets weather response, second address' do
    address = "2303 Braun Ct, Golden CO 80401"
    return_value = WeatherService.weather(address)

    expect(return_value[:data]).to have_key(:attributes)
    expect(return_value[:data][:attributes]).to have_key(:name)
    expect(return_value[:data][:attributes]).to have_key(:temperature)
    expect(return_value[:data][:attributes]).to have_key(:short_forecast)
    expect(return_value[:data][:attributes]).to have_key(:detailed_forecast)
  end
end