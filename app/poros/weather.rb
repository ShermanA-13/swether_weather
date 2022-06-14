class Weather
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temp,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon,
              :daily_weather,
              :hourly_weather

  def initialize(data)
    @datetime = Time.at(data[:current][:dt])
    @sunrise = Time.at(data[:current][:sunrise])
    @sunset = Time.at(data[:current][:sunset])
    @temp = data[:current][:temp]
    @feels_like = data[:current][:feels_like]
    @humidity = data[:current][:humidity]
    @uvi = data[:current][:uvi]
    @visibility = data[:current][:visibility]
    @conditions = data[:current][:weather][0][:description].titleize
    @icon = data[:current][:weather][0][:icon]
    @daily_weather = daily_forecast(data)
    @hourly_weather = hourly_forecast(data)
  end

  def daily_forecast(data)
    data[:daily].shift(5).map do |day|
      {
        "datetime": Date.jd(day[:dt]),
        "sunrise": Time.at(day[:sunrise]),
        "sunset": Time.at(day[:sunset]),
        "max_temp": day[:temp][:max],
        "min_temp": day[:temp][:min],
        "conditions": day[:weather][0][:description],
        "icon": day[:weather][0][:icon]
      }
    end
  end

  def hourly_forecast(data)
    data[:hourly].shift(8).map do |hour|
      {
        "time": Time.at(hour[:dt]),
        "temp": hour[:temp],
        "conditions": hour[:weather][0][:description],
        "icon": hour[:weather][0][:icon]
      }
    end
  end
end
