require 'rails_helper'

RSpec.describe Nav do
  it 'instantiates and has attributes' do
    nav_hash = {:turn_by_turn_directions=>
                [["Head toward W 25th Ave on Braun Ct. Go for 0.2 mi.", 0.1678],
                ["Turn right onto Cedar Hill Dr. Go for 259 ft.", 0.0491],
                ["Arrive at Cedar Hill Dr.", 0]],
                :total_trip_time=>65803,
                :total_distance=>1274.8648,
                :has_toll_road=>true
              }
    nav_object = Nav.new(nav_hash)

    expect(nav_object).to be_a(Nav)
    expect(nav_object.turn_by_turn_directions).to eq(nav_hash[:turn_by_turn_directions])
    expect(nav_object.total_trip_time).to eq(nav_hash[:total_trip_time])
    expect(nav_object.total_distance).to eq(nav_hash[:total_distance])
    expect(nav_object.has_toll_road).to eq(nav_hash[:has_toll_road])
  end
end