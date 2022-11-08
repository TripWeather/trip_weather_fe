class Nav
  attr_reader :turn_by_turn_directions, :total_trip_time, :total_distance, :has_toll_road

  def initialize(nav_hash)
    @turn_by_turn_directions = nav_hash[:turn_by_turn_directions]
    @total_trip_time = nav_hash[:total_trip_time]
    @total_distance = nav_hash[:total_distance]
    @has_toll_road = nav_hash[:has_toll_road]
  end
end