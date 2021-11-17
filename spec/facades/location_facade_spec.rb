require 'rails_helper'

describe LocationFacade do
  it 'returns the coordinates of the location', :vcr do
    location = LocationFacade.coords('denver, co')
    expect(location).to be_a(Location)
  end
  it 'returns the time', :vcr do
    time = LocationFacade.get_roadtrip('3 Blue Willow, Littleton, CO', 'Rim Drive, Durango, CO')
    expect(time).to eq("05:54:27")
    expect(time).to be_a(String)
  end
end
