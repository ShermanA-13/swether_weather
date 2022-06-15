require 'rails_helper'

describe 'weather poro' do
  it 'exists and has attributes', :vcr do
    data = { lat: 39.738453, lng: -104.984853 }

    forecast = WeatherFacade.find_weather(data[:lat], data[:lng])

    expect(forecast).to be_a Weather
    expect(forecast.datetime).to be_a Time
    expect(forecast.sunrise).to be_a Time
    expect(forecast.sunset).to be_a Time
    expect(forecast.temp).to be_a(Float).or be_an(Integer)
    expect(forecast.feels_like).to be_a(Float).or be_an(Integer)
    expect(forecast.humidity).to be_an Integer
    expect(forecast.uvi).to be_a(Float).or be_an(Integer)
    expect(forecast.visibility).to be_an Integer
    expect(forecast.conditions).to be_a String
    expect(forecast.icon).to be_a String
    expect(forecast.daily_weather).to be_an Array
    expect(forecast.daily_weather[0]).to include(
      :datetime,
      :sunrise,
      :sunset,
      :max_temp,
      :min_temp,
      :conditions,
      :icon
    )
    expect(forecast.daily_weather).to be_an Array
    expect(forecast.hourly_weather[0]).to include(
      :time,
      :temp,
      :conditions,
      :icon
    )
  end
end
