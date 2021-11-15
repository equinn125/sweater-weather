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
  end
end
