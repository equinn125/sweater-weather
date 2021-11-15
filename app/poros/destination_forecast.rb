class DestinationForecast
  attr_reader :summary, :temperature
  def initialize(forecast_data)
    @summary = forecast_data[:weather][0][:description]
    @temperature = "#{forecast_data[:temp]}F"
  end
end
