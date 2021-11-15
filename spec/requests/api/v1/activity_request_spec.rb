require 'rails_helper'

describe 'activity request' do
  it 'returns the activity info based on weather', :vcr do
    get '/api/v1/activities', params: {destination: 'denver,co'}
    expect(response).to be_successful
    activites = JSON.parse(response.body, symbolize_names: true)
    expect(activites).to have_key(:data)
    expect(activites).to be_a(Hash)
    expect(activites[:data][:id]).to eq(nil)
    expect(activites[:data][:type]).to eq('activities')

    expect(activites[:data]).to have_key(:attributes)
    expect(activites[:data][:attributes]).to have_key(:destination)
    expect(activites[:data][:attributes][:destination]).to be_a(String)
    expect(activites[:data][:attributes]).to have_key(:forecast)
    expect(activites[:data][:attributes][:forecast]).to have_key(:summary)
    expect(activites[:data][:attributes][:forecast]).to have_key(:temperature)

    expect(activites[:data][:attributes]).to have_key(:activities)
    expect(activites[:data][:attributes][:activities]).to be_an(Array)
    expect(activites[:data][:attributes][:activities].first).to have_key(:title)
    expect(activites[:data][:attributes][:activities].first).to have_key(:type)
    expect(activites[:data][:attributes][:activities].first).to have_key(:participants)
    expect(activites[:data][:attributes][:activities].first).to have_key(:price)
  end
  it 'has a sad path' do
      get '/api/v1/activities?destination='
      expect(response.status).to eq(404)
  end
end
