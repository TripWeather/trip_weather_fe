

require 'rails_helper'

RSpec.describe WeatherFacade do
  context '#create_weather_objects' do
    it 'takes an array of stops and returns array of weather objects', :vcr do
      address = "1823 Cedar Hill Dr, Royal Oak MI 48067"
      trip_id = 5
      stop_data = {
                  :id=>"13",
                  :type=>"stop",
                  :attributes=>{:type_of_stop=>"start"},
                  :relationships=>{:address=>{:data=>{:id=>"13", :type=>"address"}, :links=>{:related=>"https://trip-weather-2022.herokuapp.com/api/v1/106758666395730546327/trips/7/stops/13/addresses/13"}}},
                  :links=>{:self=>"https://trip-weather-2022.herokuapp.com/api/v1/110338485940940085633/trips/7/stops/13"}
                }

      address2 = "2303 Braun Ct, Golden CO 80401"
      trip_id2 = 5
      stop_data2 = {
                  :id=>"14",
                  :type=>"stop",
                  :attributes=>{:type_of_stop=>"end"},
                  :relationships=>{:address=>{:data=>{:id=>"13", :type=>"address"}, :links=>{:related=>"https://trip-weather-2022.herokuapp.com/api/v1/106758666395730546327/trips/7/stops/13/addresses/13"}}},
                  :links=>{:self=>"https://trip-weather-2022.herokuapp.com/api/v1/110338485940940085633/trips/7/stops/13"}
                }

      stop1 = Stop.new(stop_data, address, trip_id)
      stop2 = Stop.new(stop_data2, address2, trip_id2)
      array_of_stops = [stop1, stop2]
      return_value = WeatherFacade.create_weather_objects(array_of_stops)

      expect(return_value).to be_an(Array)
      expect(return_value.first).to be_a(Weather)
      expect(return_value.second).to be_a(Weather)
    end
  end
end