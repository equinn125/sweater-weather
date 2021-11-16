require 'rails_helper'

describe 'roadtrip request endpoint' do
  it 'returns road trip info-happy path', :vcr do
  user = User.create(email: 'test@test.com', password: 'password1', password_confirmation: 'password1')
    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": user.api_key
    }
    post '/api/v1/road_trip', params: body
    expect(response).to be_successful

    trip = JSON.parse(response.body, symbolize_names: true)
    expect(trip).to have_key(:data)
    expect(trip).to be_a(Hash)
  end

  it 'has a sad path if no api key is used', :vcr do
    user = User.create(email: 'test@test.com', password: 'password1', password_confirmation: 'password1')
      body = {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": " "
      }
      post '/api/v1/road_trip', params: body
      expect(response.status).to eq(401)
  end

  it 'has a sad path if destination or origin is missing', :vcr do
    user = User.create(email: 'test@test.com', password: 'password1', password_confirmation: 'password1')
      body = {
        "origin": "Denver,CO",

        "api_key": user.api_key
      }
      post '/api/v1/road_trip', params: body
      expect(response.status).to eq(400)
  end

  it 'has a response for invalid routes', :vcr do
    user = User.create(email: 'test@test.com', password: 'password1', password_confirmation: 'password1')
      body = {
        "origin": "Denver,CO",
        "destination": "London, UK",
        "api_key":user.api_key
      }
      post '/api/v1/road_trip', params: body
      expect(response).to be_successful

      trip = JSON.parse(response.body, symbolize_names: true)
  end
end
