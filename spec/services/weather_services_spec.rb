require 'rails_helper'

describe WeatherService do
  it 'returns forecast data', :vcr do
    forecast = WeatherService.get_weather('39.738453', '-104.984853')
    expect(forecast).to be_a(Hash)
    expect(forecast[:current]).to have_key(:dt)
    expect(forecast[:current]).to have_key(:temp)
    expect(forecast[:current]).to have_key(:sunrise)
    expect(forecast[:current]).to have_key(:sunset)
    expect(forecast[:current]).to have_key(:feels_like)
    expect(forecast[:current]).to have_key(:humidity)
    expect(forecast[:current]).to have_key(:uvi)
    expect(forecast[:current]).to have_key(:visibility)
    expect(forecast[:current][:weather].first).to have_key(:description)
    expect(forecast[:current][:weather].first).to have_key(:icon)
    expect(forecast[:daily].first).to have_key(:dt)
    expect(forecast[:daily].first).to have_key(:sunrise)
    expect(forecast[:daily].first).to have_key(:sunset)
    expect(forecast[:daily].first[:temp]).to have_key(:max)
    expect(forecast[:daily].first[:temp]).to have_key(:min)
    expect(forecast[:daily].first[:weather].first).to have_key(:description)
    expect(forecast[:daily].first[:weather].first).to have_key(:icon)
    expect(forecast[:hourly].first).to have_key(:dt)
    expect(forecast[:hourly].first).to have_key(:temp)
    expect(forecast[:hourly].first[:weather].first).to have_key(:description)
    expect(forecast[:hourly].first[:weather].first).to have_key(:icon)
  end
end
