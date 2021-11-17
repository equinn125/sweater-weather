require 'rails_helper'

describe 'forecast endpoint' do
  it 'returns the weather data for a location-happy path', :vcr do
    get '/api/v1/forecast', params: {location: 'denver,co'}
    expect(response).to be_successful
    expect(response.status).to eq(200)
    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast).to have_key(:data)
    expect(forecast).to be_a(Hash)
    expect(forecast[:data][:id]).to eq(nil)
    expect(forecast[:data][:type]).to eq('forecast')
    expect(forecast[:data]).to have_key(:attributes)
    expect(forecast[:data][:attributes]).to_not have_key(:minutely)
    expect(forecast[:data][:attributes]).to_not have_key(:alerts)
    expect(forecast[:data][:attributes]).to have_key(:current_weather)

    expect(forecast[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(forecast[:data][:attributes][:current_weather][:datetime]).to be_a(String)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunrise)
    expect(forecast[:data][:attributes][:current_weather][:sunrise]).to be_a(String)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunset)
    expect(forecast[:data][:attributes][:current_weather][:sunset]).to be_a(String)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:temp)
    expect(forecast[:data][:attributes][:current_weather][:temp]).to be_a(Float)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(forecast[:data][:attributes][:current_weather][:feels_like]).to be_a(Float)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(forecast[:data][:attributes][:current_weather][:humidity]).to be_a(Integer)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:uvi)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:conditions)
    expect(forecast[:data][:attributes][:current_weather][:conditions]).to be_a(String)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:icon)
    expect(forecast[:data][:attributes][:current_weather][:icon]).to be_a(String)
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:moonrise)
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:moonset)
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:moonphase)
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:dewpoint)
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:wind_speed)

    expect(forecast[:data][:attributes][:hourly_weather].first).to have_key(:time)
    expect(forecast[:data][:attributes][:hourly_weather].first).to have_key(:temp)
    expect(forecast[:data][:attributes][:hourly_weather].first).to have_key(:conditions)
    expect(forecast[:data][:attributes][:hourly_weather].first).to have_key(:icon)

    expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:date)
    expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:sunrise)
    expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:sunset)
    expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:max_temp)
    expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:min_temp)
    expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:conditions)
    expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:icon)
  end

  it 'has a sad path', :vcr do
    get '/api/v1/forecast?location='
    expect(response.status).to eq(404)
  end
end
