class TripService
  def self.trips_by_uid(google_id)
    response = conn.get("#{google_id}/trips")
    parse(response)
  end

private

  def self.conn
    Faraday.new('http://localhost:3000/api/v1/')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
