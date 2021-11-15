class Activities
  def initialize(activity_data,activity_data_temp, q_destination, forecast_data)
    @id = nil
    @destination = q_destination
    @forecast = DestinationForecast.new(forecast_data)
    @activites =
  end
end

#want to put all info here destination,
#forecast, activities
