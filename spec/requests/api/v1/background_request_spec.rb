require 'rails_helper'

describe 'background request endpoint' do
  it 'happy path-returns image', :vcr do
    get '/api/v1/backgrounds', params: {location: 'denver,co'}
    expect(response).to be_successful
    expect(response.status).to eq(200)
    background = JSON.parse(response.body, symbolize_names: true)
    expect(background).to have_key(:data)
    expect(background).to be_a(Hash)
    expect(background[:data][:id]).to eq(nil)
    expect(background[:data][:type]).to eq('image')
    expect(background[:data]).to have_key(:attributes)
    expect(background[:data][:attributes]).to have_key(:description)
    expect(background[:data][:attributes][:description]).to be_a(String)
    expect(background[:data][:attributes]).to have_key(:image_url)
    expect(background[:data][:attributes][:image_url]).to be_a(String)
    expect(background[:data][:attributes]).to have_key(:site)
    expect(background[:data][:attributes][:site]).to be_a(String)
    expect(background[:data][:attributes]).to have_key(:photographer)
    expect(background[:data][:attributes][:photographer]).to be_a(String)
    expect(background[:data][:attributes]).to have_key(:photographer_site)
    expect(background[:data][:attributes][:photographer_site]).to be_a(String)
  end

  it ' has a sad path' do
    get '/api/v1/backgrounds?location='
    expect(response.status).to eq(404)
  end
end
