class Api::V1::RoadTripController<ApplicationController

  def create
    user = User.find_by(api_key: params[:api_key])
    if params[:destination].empty? || params[:origin].empty?
    render json: { errors: 'Invalid parameters' }, status: 400
    elsif user
    coords = LocationFacade.coords(params[:destination])
    time = LocationFacade.get_roadtrip(params[:origin], params[:destination])
    forecast = WeatherFacade.get_destination_weather(coords.latitude, coords.longitude, time.split(":").first.to_i)
    render json: RoadTripSerializer.new_trip(params[:destination],params[:origin], time, forecast)
    else
    render json: { errors: 'Unathorized' }, status: 401
    end
  end
end
