class TripFacade

  def self.all_trips(google_id)
    trips_data = TripService.trips_by_uid(google_id)
    trips_data[:data].map do |trip_list|
      Trip.new(trip_list)
    end
  end

end
