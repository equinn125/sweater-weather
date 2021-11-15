class ImageService
  class << self
    def get_image(location)
      response = conn.get('/search/photos?') do |faraday|
        faraday.params[:query] = location
        faraday.params[:per_page] = 1
        faraday.params[:orientation] = 'landscape'
      end
      parse_json(response)
    end
    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: 'https://api.unsplash.com') do |faraday|
        faraday.params['client_id'] = ENV['unsplash_key']
      end
    end
  end
end
