require 'rails_helper'

describe Forecast do
it 'has all weather objects' do
    forecast = Forecast.new(weather_data)
    expect(forecast.current_weather).to be_a(CurrentWeather)
    expect(forecast.hourly_weather).to be_a(Array)
    expect(forecast.hourly_weather.first).to be_a(HourlyWeather)
    expect(forecast.hourly_weather.count).to eq(8)
    expect(forecast.daily_weather.count).to eq(5)
    expect(forecast.daily_weather).to be_a(Array)
    expect(forecast.daily_weather.first).to be_a(DailyWeather)
  end
end
