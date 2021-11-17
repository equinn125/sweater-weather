class Api::V1::ForecastController < ApplicationController
  def show
  if  !params[:location].empty?
    location = LocationFacade.coords(params[:location])
    forecast = WeatherFacade.get_forecast(location.latitude, location.longitude)
    render json: ForecastSerializer.new(forecast).serializable_hash, status: 200
  else
    render json:  {"error": "not_found"}, status: 404
    end
  end
end
