class TripService
  def self.trips_by_uid(uid)
    response = conn.get("#{uid}/trips")
    parse(response)
  end

  def self.trip_by_id(uid, trip_id)
    response = conn.get("#{uid}/trips/#{trip_id}")
    parse(response)
  end

  def self.create_trip(name, uid, departure_date, arrival_date)
    conn.post("#{uid}/trips") do |req|
       req.params[:name] = name
       req.params[:departure_date] = departure_date
       req.params[:arrival_date] = arrival_date
    end
  end

  def self.delete_trip(uid, trip_id)
    conn.delete("#{uid}/trips/#{trip_id}")
  end 

private

  def self.conn
    Faraday.new('http://localhost:3000/api/v1/')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
  # def self.conn2
  #   Faraday.new("http://trip-weather-2022.herokuapp.com/api/v1")
  # end
