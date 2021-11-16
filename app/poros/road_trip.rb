class Roadtrip
  attr_reader :start_city, :end_city, :travel_time, :weather_at_eta
  def initialize(result, weather, start, finish)
    @travel_time = result[:formattedTime]
    @start_city = start_city
    @end_city = end_city
    @weather_at_eta = WeatherAtEta.new(@travel_time, weather)
  end
end
