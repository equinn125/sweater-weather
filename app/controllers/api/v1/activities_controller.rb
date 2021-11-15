class Api::V1::ActivitiesController< ApplicationController
  def index
    coord_data = LocationFacade.coords(params[:destination])
    activities = ActivityFacade.get_activities(coord_data.latitude, coord_data.longitude, params[:destination])
    render json:ActivitiesSerializer.new(activities)
  end
end
#first need to input location('destination') as a param
#want a poro to hold all of this
#this goes through the geocoder Api so need that facade
#then this goes to the weather facade
#we are ONLY getting things from current weather(poro for destination weather?)
#somewhere we are doing the logic to determine what the activity type is based on
#the temp, then we are putting this into a facade.
