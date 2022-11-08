class StopsFacade

  def self.all_stops(uid, trip_id)
    stops_data = TripService.all_stops(uid, trip_id)
      stops_data[:data].map do |stop_list|
      address_data = TripService.address(uid, trip_id, stop_list[:relationships][:address][:data][:id], stop_list[:id])
      address = address_data[:data][:attributes][:location]
      stop = Stop.new(stop_list, address, trip_id)
    end 
  end
end
