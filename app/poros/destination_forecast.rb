class DestinationForecast
  attr_reader :summary, :temp
  def initialize(forecast_data)
    @summary = forecast_data[:weather][0][:description]
    @temp= forecast_data[:temp]
  end
end
