class WeatherFacade
  class << self
    def find_weather(lat, lon)
      json = WeatherService.get_weather(lat, lon)
      Weather.new(json)
    end
  end
end
