require 'rails_helper'

describe HourlyWeather do
  it 'has attributes' do
    data = {
        "dt": 1636848000,
        "temp": 58.5,
        "feels_like": 55.36,
        "pressure": 1015,
        "humidity": 28,
        "dew_point": 26.28,
        "uvi": 0,
        "clouds": 14,
        "visibility": 10000,
        "wind_speed": 7.07,
        "wind_deg": 339,
        "wind_gust": 12.84,
        "weather": [
            {
                "id": 801,
                "main": "Clouds",
                "description": "few clouds",
                "icon": "02n"
            }
        ],
        "pop": 0
    }
    weather = HourlyWeather.new(data)
    expect(weather.time).to eq('05:11 PM')
    expect(weather.temp).to eq(58.5)
    expect(weather.conditions).to eq("few clouds")
    expect(weather.icon).to eq("02n")
  end
end
