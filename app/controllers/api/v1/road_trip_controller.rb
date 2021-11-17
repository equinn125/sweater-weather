class Api::V1::RoadTripController<ApplicationController

  def create
    user = User.find_by(api_key: params[:api_key])
    if bad_params
      render json: { errors: 'Invalid parameters' }, status: 400
    elsif user && time
      coords = LocationFacade.coords(params[:destination])
      forecast = WeatherFacade.get_destination_weather(coords.latitude, coords.longitude, time)
      render json: RoadTripSerializer.new_trip(params[:destination],params[:origin], time, forecast), status: 200
    elsif user && time.nil?
      render json: RoadTripSerializer.no_route(params[:destination],params[:origin]), status: 200
      else
      render json: { errors: 'Unathorized' }, status: 401
    end
  end

  private
  def time
    time = LocationFacade.get_roadtrip(params[:origin], params[:destination])
  end

  def bad_params
    params[:destination].nil? || params[:origin].nil?
  end
end
