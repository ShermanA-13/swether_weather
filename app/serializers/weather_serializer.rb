class WeatherSerializer
  def self.weather(forecast)
    { "data":
      {
        "id": nil,
        "type": 'forecast',
        "attributes":
         {
           "current_weather":
           {
             "datetime": forecast.datetime,
             "sunrise": forecast.sunrise,
             "sunset": forecast.sunset,
             "temp": forecast.temp,
             "feels_like": forecast.feels_like,
             "humidity": forecast.humidity,
             "uvi": forecast.uvi,
             "visibility": forecast.visibility,
             "conditions": forecast.conditions,
             "icon": forecast.icon
           },
           "daily_weather": forecast.daily_weather,
           "hourly_weather": forecast.hourly_weather
         }
      } }
  end
end
