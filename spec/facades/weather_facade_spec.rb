require 'rails_helper'

describe WeatherFacade do
  it ' returns a forecast object',:vcr do
    weather = WeatherFacade.get_forecast('39.738453', '-104.984853')
    expect(weather).to be_a(Forecast)
  end

  it 'returns the weather for an eta', :vcr do
    forecast = WeatherFacade.get_destination_weather('39.738453', '-104.984853', 3)
    expect(forecast).to be_a(EtaForecast)
  end
end
