require 'rails_helper'

describe Location do
  it 'has attributes' do
    location = Location.new(location_data)
    expect(location.latitude).to eq(39.738453)
    expect(location.longitude).to eq(-104.984853)
  end
end
