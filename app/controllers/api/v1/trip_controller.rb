class Api::V1::TripController < ApplicationController
  before_action :valid_api_key?, only: [:create]
  before_action :road_trip_params_present?, only: [:create]

  def create
    coords = MapFacade.get_coords(params[:destination])
    forecast = WeatherFacade.find_weather(coords[:lat], coords[:lng])
    trip = MapFacade.trip_info(params[:origin], params[:destination])
    render json: TripSerializer.new_trip(
      forecast,
      trip
    ), status: 201
  end

  private

  def trip_params
    params.require(:road_trip).permit(:origin, :destination, :api_key)
  end
end
