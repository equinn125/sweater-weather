require 'rails_helper'

describe ImageService do
  it 'returns image data for the location', :vcr do
    image = ImageService.get_image('denver,co')
    expect(image).to be_a(Hash)
    expect(image[:results]).to be_a(Array)
    expect(image[:results].count).to eq(1)
    expect(image[:results].first).to have_key(:urls)
    expect(image[:results].first[:urls]).to have_key(:full)
    expect(image[:results].first).to have_key(:user)
    expect(image[:results].first[:user]).to have_key(:links)
  end
end
