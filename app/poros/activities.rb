class Activities
  attr_reader :id, :destination, :forecast, :activites
  def initialize (q_destination, activity_data,forecast_data, activity_data_temp)
    @id = nil
    @forecast = DestinationForecast.new(forecast_data)
    @activites = [ActivityInfo.new(activity_data), ActivityInfo.new(activity_data_temp)]
    @destination = q_destination
  end
end

#want to put all info here destination,
#forecast, activities
