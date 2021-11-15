class ActivityFacade
  class << self
    def get_activities(lat,long, q_destination)
      forecast_data = WeatherService.get_weather(lat,long)[:current]
      if forecast_data[:temp] >= 60
        type = 'recreational'
      elsif forecast_data[:temp] >= 50 && forecast_data[:temp] < 60
        type = 'busywork'
      elsif forecast_data[:temp] < 50
          type = 'cooking'
        else

        end
        activity_data_temp = BoredService.get_activity(type)
        activity_data = BoredService.get_activity('relaxation')
        # Activities.new(q_destination,activity_data, activity_data_temp, forecast_data)
    end
  end
end
#call bored service last with type
#call forecast first with coords
#then make the activites object (pass in Destinationparam
#pass in forecast data, pass in activity data)
