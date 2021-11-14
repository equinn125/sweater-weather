class Forecast
  attr_reader :id, :current_weather, :hourly_weather, :daily_weather
  def initialize(data)
    @id = nil
    @current_weather = CurrentWeather.new(data[:current])
    @hourly_weather = data[:hourly].first(8).map do |hourly|
      HourlyWeather.new(hourly)
    end
    @daily_weather = data[:daily].first(5).map do |daily|
      DailyWeather.new(daily)
    end
  end
end
