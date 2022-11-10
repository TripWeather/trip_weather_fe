class WeatherService

  def self.connection
    Faraday.new("http://trip-weather-2022.herokuapp.com")
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.weather(address)

    response = connection.get("/api/v1/weather", {address: address})
    parse(response)
  end
end