class WeatherService
  def self.connection
    Faraday.new('http://localhost:3000/api/v1/')
  end

  # def self.connection2
  #   Faraday.new("http://trip-weather-2022.herokuapp.com/api/v1")
  # end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.weather(address)
    response = connection.get("weather", {address: address})
    parse(response)
  end
end