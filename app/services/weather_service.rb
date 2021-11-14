class WeatherService
  class << self

    def get_weather(lat, long)
      response = conn.get('/data/2.5/onecall?') do |faraday|
        faraday.params[:lat] = lat
        faraday.params[:lon] = long
        faraday.params[:exclude] = 'minutely'
        faraday.params[:units] = 'imperial'
      end
      parse_json(response)
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: 'https://api.openweathermap.org') do |faraday|
        faraday.params['appid'] = ENV['weather_key']
      end
    end
  end
end
