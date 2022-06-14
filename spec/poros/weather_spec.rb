require 'rails_helper'

describe 'weather poro' do
  it 'exists and has attributes', :vcr do
    data = { lat: 39.738453, lng: -104.984853 }

    forecast = WeatherFacade.find_weather(data[:lat], data[:lng])
    expect(forecast).to be_a Weather
  end
end
