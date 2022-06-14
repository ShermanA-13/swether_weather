require 'rails_helper'
RSpec.describe WeatherFacade do
  it '.find_weather', :vcr do
    data = { lat: 39.738453, lng: -104.984853 }
    forecast = WeatherFacade.find_weather(data[:lat], data[:lng])

    expect(forecast).to be_a Weather
  end
end
