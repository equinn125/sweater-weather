require 'rails_helper'

describe DirectionsService do
  it 'returns direction data', :vcr do
    direction = DirectionsService.get_directions('3 Blue Willow, Littleton, CO', 'Rim Drive, Durango, CO')
    expect(direction).to be_a(Hash)
    expect(direction).to have_key(:route)
    expect(direction[:route]).to be_a(Hash)
    expect(direction[:route]).to have_key(:formattedTime)
    expect(direction[:route][:formattedTime]).to be_a(String)
  end
end
