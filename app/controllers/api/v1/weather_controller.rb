class Api::V1::WeatherController < ApplicationController
  before_action :check_location

  def index
    forecast = WeatherFacade.find_weather(@coordinates[:lat], @coordinates[:lng])
    render json: WeatherSerializer.weather(forecast)
  end

  private

  def check_location
    if params[:location].present?
      @coordinates = MapFacade.get_coords(params[:location])
    else
      render status: 404
    end
  end
end
