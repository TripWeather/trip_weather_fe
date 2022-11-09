class Nav
  attr_reader :turn_by_turn_directions, :total_trip_time, :total_distance, :has_toll_road


  def initialize(nav_hash)
    @turn_by_turn_directions = nav_hash[:turn_by_turn_directions]
    @total_trip_time = convert_to_h_m_s(nav_hash[:total_trip_time])
    @total_distance = nav_hash[:total_distance]
    @has_toll_road = nav_hash[:has_toll_road]
  end

  def convert_to_h_m_s(seconds:)
    seconds = seconds.to_i
    _hours = seconds / 3600
    seconds = seconds % 3600
    _minutes = seconds / 60
    _seconds = seconds % 60
    str_arr = []
    str_arr << "#{_hours} hours" if _hours > 0
    str_arr << "#{_minutes} minutes" if _minutes > 0
    str_arr << "#{_seconds} seconds" if _seconds > 0
    str_arr.join(" ")
  end
end