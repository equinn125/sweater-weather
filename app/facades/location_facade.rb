class LocationFacade
  class << self
    def coords(location)
      loc_data = LocationService.get_coords(location)[:results][0][:locations][0]
      Location.new(loc_data)
    end

    def get_roadtrip(start, finish)
      time = LocationService.get_directions(start, finish)[:route][:formattedTime]
    end
  end
end
