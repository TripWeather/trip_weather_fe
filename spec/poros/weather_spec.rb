require 'rails_helper'

RSpec.describe Weather do
  it 'instantiates and has attributes' do
    weather_hash = {
                    :name=>"Tonight", 
                    :temperature=>40, 
                    :short_forecast=>"Partly Cloudy", 
                    :detailed_forecast=>"Partly cloudy, with a low around 40. East wind around 7 mph."
                  }
    weather_object = Weather.new(weather_hash)

    expect(weather_object).to be_a(Weather)
    expect(weather_object.name).to eq(weather_hash[:name])             
    expect(weather_object.temperature).to eq(weather_hash[:temperature])             
    expect(weather_object.short_forecast).to eq(weather_hash[:short_forecast])             
    expect(weather_object.detailed_forecast).to eq(weather_hash[:detailed_forecast])             
  end
end