require 'rails_helper'

describe LocationService do
  it 'can return the data for a given location', :vcr do
    location = LocationService.get_coords('denver,co')
    expect(location).to be_a(Hash)
    expect(location[:results]).to be_a(Array)
    expect(location[:results].first).to have_key(:locations)
    expect(location[:results].first[:locations][0]).to have_key(:latLng)
  end
end
