require 'rails_helper'

describe Location do
  it 'has attributes' do
    data =  {
          "dt": 1636850266,
          "sunrise": 1636810962,
          "sunset": 1636847163,
          "temp": 58.46,
          "feels_like": 55.42,
          "pressure": 1015,
          "humidity": 30,
          "dew_point": 27.73,
          "uvi": 0,
          "clouds": 0,
          "visibility": 10000,
          "wind_speed": 1.01,
          "wind_deg": 319,
          "wind_gust": 8.01,
          "weather": [
              {
                  "id": 800,
                  "main": "Clear",
                  "description": "clear sky",
                  "icon": "01n"
              }
          ]
      }
    weather = CurrentWeather.new(data)
    expect(weather.datetime).to eq('2021-11-13 17:37:46 -0700')
    expect(weather.temp).to eq(58.46)
    expect(weather.sunrise).to eq('2021-11-13 06:42:42 -0700')
    expect(weather.sunset).to eq('2021-11-13 16:46:03 -0700')
    expect(weather.feels_like).to eq(55.42)
    expect(weather.humidity).to eq(30)
    expect(weather.uvi).to eq(0)
    expect(weather.visibility).to eq(10000)
    expect(weather.conditions).to eq("clear sky")
    expect(weather.icon).to eq("01n")
  end
end
