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
    response = conn.post("#{uid}/trips") do |req|
                req.params[:trip] = { name: name,
                                      uid: uid,
                                      departure_date: departure_date,
                                      arrival_date: arrival_date }
                req.headers['Content-Type'] = 'application/json'
                req.body = {query: 'new_trip'}.to_json
              end
  end

  def self.delete_trip(uid, trip_id)
    conn.delete("#{uid}/trips/#{trip_id}")
  end

  def self.update_trip(trip_id, name, uid, departure_date, arrival_date)
      response = conn.put("#{uid}/trips/#{trip_id}") do |req|
                  req.params[:trip] = { name: name,
                              uid: uid,
                              departure_date: departure_date,
                              arrival_date: arrival_date }
                  req.headers['Content-Type'] = 'application/json'
                  req.body = {query: 'update_trip'}.to_json
                end
  end

  def self.create_stops(trip_id, uid, address, type)
    response = conn.post("#{uid}/trips/#{trip_id}/stops") do |req|
                req.params[:stop] = {  location: address,
                                          type_of_stop: type }
                req.headers['Content-Type'] = 'application/json'
                req.body = {query: 'create_stop'}.to_json
              end
  end

  def self.all_stops(uid, trip_id)
    response = conn.get("#{uid}/trips/#{trip_id}/stops")
    parse(response)
  end

  def self.address(uid, trip_id, address_id, stop_id)
    response = conn.get("#{uid}/trips/#{trip_id}/stops/#{stop_id}/addresses/#{address_id}")
    parse(response)
  end

  def self.update_address(uid, trip_id, address_id, address, stop_id)
    response = conn.put("#{uid}/trips/#{trip_id}/stops/#{stop_id}/addresses/#{address_id}") do |req|
      req.params[:address] = {location: address}
      req.headers['Content-Type'] = 'application/json'
      req.body = {query: 'update_address'}.to_json
    end
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
