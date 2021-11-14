require 'rails_helper'

describe LocationFacade do
  it 'returns the coordinates of the location', :vcr do
    location = LocationFacade.coords('denver, co')
    expect(location).to be_a(Location)

  end
end
