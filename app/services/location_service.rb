class LocationService
  class << self
    def get_coords(location)
      response = conn.get('/geocoding/v1/address?') do |faraday|
        faraday.params[:location] = location
        faraday.params[:max_results] = 1
      end
      parse_json(response)
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: 'http://www.mapquestapi.com') do |faraday|
        faraday.params['key'] = ENV['map_key']
      end
    end
  end
end
