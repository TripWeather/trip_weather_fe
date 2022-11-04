class Trip
  attr_reader :id,
              :name,
              :departure_date,
              :arrival_date

  def initialize(trip_data)
    @id = trip_data[:id]
    @name = trip_data[:attributes][:name]
    @departure_date = trip_data[:attributes][:departure_date]
    @arrival_date = trip_data[:attributes][:arrival_date]
  end

  def standard_time(time)
    DateTime.parse(time).strftime("%A, %d %b %Y%l:%M %p")
  end
end
