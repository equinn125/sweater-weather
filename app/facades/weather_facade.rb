class WeatherFacade
  class << self
    def get_forecast(lat, long)
      data = WeatherService.get_weather(lat, long)
      Forecast.new(data)
    end
    def get_destination_weather(lat, long, time)
      time = time.split(":").first.to_i
      forecast_data = WeatherService.get_weather(lat, long)[:hourly]
      forecast = forecast_data.map do |data|
        EtaForecast.new(data)
      end
      forecast[time]
    end
  end
end
