class ApplicationController < ActionController::API
  def valid_api_key?
    if params[:api_key].present?
      render json: { error: 'Invalid API key' }, status: 401 unless User.exists?(api_key: params[:api_key])
    else
      render json: { error: 'Missing API key' }, status: 400
    end
  end

  def road_trip_params_present?
    unless params[:destination].present? && params[:origin].present?
      render json: { error: 'Missing destination or origin locations' }, status: 400
    end
  end
end
