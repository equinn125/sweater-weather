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
    expect(response.status).to eq(200)

    trip = JSON.parse(response.body, symbolize_names: true)
    expect(trip).to have_key(:data)
    expect(trip).to be_a(Hash)
    expect(trip[:data]).to have_key(:id)
    expect(trip[:data][:id]).to eq(nil)
    expect(trip[:data]).to have_key(:type)
    expect(trip[:data][:type]).to eq("roadtrip")
    expect(trip[:data]).to have_key(:attributes)
    expect(trip[:data][:attributes]).to have_key(:start_city)
    expect(trip[:data][:attributes][:start_city]).to be_a(String)
    expect(trip[:data][:attributes]).to have_key(:end_city)
    expect(trip[:data][:attributes][:end_city]).to be_a(String)
    expect(trip[:data][:attributes]).to have_key(:travel_time)
    expect(trip[:data][:attributes][:travel_time]).to be_a(String)
    expect(trip[:data][:attributes]).to have_key(:weather_at_eta)
    expect(trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
    expect(trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    expect(trip[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
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
      expect(response.status).to eq(200)

      trip = JSON.parse(response.body, symbolize_names: true)
      expect(trip).to have_key(:data)
      expect(trip).to be_a(Hash)
      expect(trip[:data]).to have_key(:id)
      expect(trip[:data][:id]).to eq(nil)
      expect(trip[:data]).to have_key(:type)
      expect(trip[:data][:type]).to eq("roadtrip")
      expect(trip[:data]).to have_key(:attributes)
      expect(trip[:data][:attributes]).to have_key(:start_city)
      expect(trip[:data][:attributes][:start_city]).to be_a(String)
      expect(trip[:data][:attributes]).to have_key(:end_city)
      expect(trip[:data][:attributes][:end_city]).to be_a(String)
      expect(trip[:data][:attributes]).to have_key(:travel_time)
      expect(trip[:data][:attributes][:travel_time]).to be_a(String)
      expect(trip[:data][:attributes]).to_not have_key(:weather_at_eta)
  end
end
