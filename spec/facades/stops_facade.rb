require 'rails_helper'

describe 'Stops Facade' do
  it 'addresses_by_stops', :vcr do
    addresses_by_stops = StopsFacade.all_stops("1000", "6")

    expect(addresses_by_stops).to be_an(Array)
    expect(addresses_by_stops).to be_a(Stop)
  end
end 
