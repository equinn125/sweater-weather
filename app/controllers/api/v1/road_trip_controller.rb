class Api::V1::RoadTripController<ApplicationController

  def create
    user = User.find_by(api_key: params[:api_key])
    if params[:destination].nil? || params[:origin].nil?
      render json: { errors: 'Invalid parameters' }, status: 400
    elsif user && time
      coords = LocationFacade.coords(params[:destination])
      forecast = WeatherFacade.get_destination_weather(coords.latitude, coords.longitude, time)
      render json: RoadTripSerializer.new_trip(params[:destination],params[:origin], time, forecast)
    elsif user && time.nil?
      render json: RoadTripSerializer.no_route(params[:destination],params[:origin])
      else
      render json: { errors: 'Unathorized' }, status: 401
    end
  end

  private
  def time
    time = LocationFacade.get_roadtrip(params[:origin], params[:destination])
  end
end
