class Trip
  attr_reader :id,
              :name,
              :departure_date,
              :arrival_date,
              :user_id

  def initialize(trip_data)
    @id = trip_data[:id]
    @name = trip_data[:attributes][:name]
    @departure_date = trip_data[:attributes][:departure_date]
    @arrival_date = trip_data[:attributes][:arrival_date]
    #added this to connect our database to the api database
  end

  def standard_time(time)
    DateTime.parse(time).strftime("%A, %d %b %Y%l:%M %p")
  end
  
  def self.three_most_recent_trips
    binding.pry
  end
end
