class NavService
  def self.conn
    Faraday.new('http://localhost:3000/api/v1/')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.nav(start_address, end_address)
    response = conn.get("nav", {from: start_address, to: end_address})                
    parse(response)
  end
end