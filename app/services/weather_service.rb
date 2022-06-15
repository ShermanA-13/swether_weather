class WeatherService < BaseService
  class << self
    def url
      url = 'https://api.openweathermap.org/data/2.5/onecall?'
    end

    def get_weather(lat, lon)
      response = conn(url).get do |faraday|
        faraday.params['appid'] = ENV['weather_api_key']
        faraday.params['lat'] = lat
        faraday.params['lon'] = lon
        faraday.params['units'] = 'imperial'
        faraday.params['exclude'] = 'minutely'
      end
      get_json(response)
    end
  end
end
