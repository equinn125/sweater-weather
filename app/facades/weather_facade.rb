class WeatherFacade
  class << self
    def get_forecast(lat, long)
      data = WeatherService.get_weather(lat, long)
      Forecast.new(data)
    end
  end
end
