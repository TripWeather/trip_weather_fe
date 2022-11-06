class TripFacade

  def self.all_trips(google_id)
    trips_data = TripService.trips_by_uid(google_id)
    trips_data[:data].map do |trip_list|
      trip = Trip.new(trip_list)
    end.sort_by(&:departure_date)
  end

  def self.trip_by_id(uid, trip_id)
    trip_data = TripService.trip_by_id(uid, trip_id)
    Trip.new(trip_data[:data])
  end

  def self.create_trip(name, uid, departure_date)
    TripService.create_trip(name, uid, departure_date)
  end

end
