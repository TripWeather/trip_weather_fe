class WeatherFacade < WeatherService
  def self.create_weather_objects(stops)
    stops.map do |stop|
      response_hash = weather(stop.address)
      Weather.new(response_hash[:data][:attributes])
    end
  end
end