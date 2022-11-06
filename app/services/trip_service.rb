class TripService
  def self.trips_by_uid(google_id)
    response = conn.get("#{google_id}/trips")
    parse(response)
  end

  def self.trip_by_id(uid, trip_id)
    response = conn.get("#{uid}/trips/#{trip_id}")
    parse(response)
  end

  def self.create_trip(name, uid, departure_date)

  end

private

  def self.conn
    Faraday.new('http://localhost:3000/api/v1/')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  # def self.conn2
  #   Faraday.new("http://trip-weather-2022.herokuapp.com/api/v1")
  # end
end
