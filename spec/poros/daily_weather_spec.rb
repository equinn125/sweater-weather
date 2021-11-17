require 'rails_helper'

describe DailyWeather do
  it 'has attributes' do
  data = {
        "dt": 1636826400,
        "sunrise": 1636810962,
        "sunset": 1636847163,
        "moonrise": 1636838880,
        "moonset": 1636790160,
        "moon_phase": 0.33,
        "temp": {
            "day": 60.13,
            "min": 46.99,
            "max": 63.81,
            "night": 50.95,
            "eve": 58.5,
            "morn": 48.06
        },
        "feels_like": {
            "day": 57.07,
            "night": 47.35,
            "eve": 55.36,
            "morn": 45.57
        },
        "pressure": 1015,
        "humidity": 26,
        "dew_point": 24.91,
        "wind_speed": 8.05,
        "wind_deg": 296,
        "wind_gust": 26.37,
        "weather": [
            {
                "id": 804,
                "main": "Clouds",
                "description": "overcast clouds",
                "icon": "04d"
            }
        ],
        "clouds": 100,
        "pop": 0,
        "uvi": 2.07
    }
    weather = DailyWeather.new(data)
    expect(weather.date).to eq('2021-11-13')
    expect(weather.date).to be_a(String)
    expect(weather.sunrise).to eq('2021-11-13 06:42:42 -0700')
    expect(weather.sunset).to eq('2021-11-13 16:46:03 -0700')
    expect(weather.max_temp).to eq(63.81)
    expect(weather.max_temp).to be_a(Float)
    expect(weather.min_temp).to eq(46.99)
    expect(weather.min_temp).to be_a(Float)
    expect(weather.conditions).to eq("overcast clouds")
    expect(weather.conditions).to be_a(String)
    expect(weather.icon).to eq("04d")
    expect(weather.icon).to be_a(String)
  end
end
