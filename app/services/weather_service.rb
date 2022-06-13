class WeatherService
  class << self
    def conn
      url = 'https://api.openweathermap.org/data/2.5/onecall?'
      Faraday.new(url: url) do |faraday|
        faraday.params['appid'] = ENV['weather_api_key']
      end
    end

    def get_weather(lat, lon)
      response = conn.get do |faraday|
        faraday.params['lat'] = lat
        faraday.params['lon'] = lon
        faraday.params['units'] = 'imperial'
        faraday.params['exclude'] = 'minutely'
      end
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
