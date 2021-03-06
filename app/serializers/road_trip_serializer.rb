class RoadTripSerializer
  def  self.new_trip(destination, origin, time, forecast)
    {
      "data": {
      "id": nil,
      "type": "roadtrip",
      "attributes": {
      "start_city": origin,
      "end_city": destination,
      "travel_time": time,
      "weather_at_eta": {
      "temperature": forecast.temperature,
      "conditions": forecast.conditions
                  }
                }
              }
            }
    end

    def self.no_route(destination, origin)
      {
        "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
        "start_city": origin,
        "end_city": destination,
        "travel_time": "impossible route"
          }
        }
      }
    end
end
