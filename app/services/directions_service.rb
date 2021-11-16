class DirectionsService
  class << self
    def get_directions(start, finish)
      response = conn.get('/directions/v2/route?') do |faraday|
        faraday.params[:from] = start
        faraday.params[:to] = finish
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
