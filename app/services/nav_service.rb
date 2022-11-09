class NavService

  def self.nav(start_address, end_address)
    response = conn.get("/api/v1/nav", {from: start_address, to: end_address})
    parse(response)
  end

  private
  # def self.conn
  #   Faraday.new('http://localhost:3000/api/v1/')
  # end

  def self.conn
    Faraday.new("http://trip-weather-2022.herokuapp.com")
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
