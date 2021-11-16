require 'rails_helper'

describe LocationService do
  it 'can return the data for a given location', :vcr do
    location = LocationService.get_coords('denver,co')
    expect(location).to be_a(Hash)
    expect(location[:results]).to be_a(Array)
    expect(location[:results].first).to have_key(:locations)
    expect(location[:results].first[:locations][0]).to have_key(:latLng)
  end
  it 'returns direction data', :vcr do
    direction = LocationService.get_directions('3 Blue Willow, Littleton, CO', 'Rim Drive, Durango, CO')
    expect(direction).to be_a(Hash)
    expect(direction).to have_key(:route)
    expect(direction[:route]).to be_a(Hash)
    expect(direction[:route]).to have_key(:formattedTime)
    expect(direction[:route][:formattedTime]).to be_a(String)
  end
end
