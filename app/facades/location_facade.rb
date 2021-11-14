class LocationFacade
  class << self
    def coords(location)
      loc_data = LocationService.get_coords(location)[:results][0][:locations][0]
      Location.new(loc_data)
    end
  end
end
