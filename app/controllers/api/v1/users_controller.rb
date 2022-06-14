class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.user_data(user), status: 201
    else
      render json: { error: user.errors.full_messages.to_sentence }, status: 404
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :api_key)
  end
end
