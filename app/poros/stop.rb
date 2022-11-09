class Stop
  attr_reader :trip_id,
              :address_id,
              :type_of_stop,
              :address,
              :stop_id


  def initialize(stop_data, address, trip_id)
    @trip_id = trip_id
    @address_id = stop_data[:relationships][:address][:data][:id]
    @type_of_stop = stop_data[:attributes][:type_of_stop]
    @stop_id = stop_data[:id]
    @address = address
  end
end
