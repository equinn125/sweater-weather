class ActivityFacade
  class << self
    def get_activities(lat,long)
      forecast_data = WeatherService.get_weather(lat,long)[:current]
      if forecast_data[:temp] >= 60
        type = 'recreational'
      elsif forecast_data[:temp] >= 50 && forecast_data[:temp] < 60
        type = 'busywork'
      elsif forecast_data[:temp] < 50
          type = 'cooking'
        end
        activity_data = BoredService.get_activity(type)
        binding.pry
    end
  end
end
#call bored service last with type
#call forecast first with coords
#then make the activites object (pass in Destinationparam
#pass in forecast data, pass in activity data)
