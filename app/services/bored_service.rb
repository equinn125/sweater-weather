class BoredService
  class << self

    def get_activity(type)
      response = conn.get('/api/activity?') do |faraday|
        faraday.params[:type] = type
      end
      parse_json(response)
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: 'http://www.boredapi.com')
    end
  end
end
