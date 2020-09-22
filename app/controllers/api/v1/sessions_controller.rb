class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: session_params[:email])
    if user.present? && user.authenticate(session_params[:password])
      render json: UserSerializer.new(user)
    elsif user.nil?
      render json: { error: 'Invalid Credentials', status: 404 }, status: 404
    else
      render json: { error: 'Invalid password', status: 401 }, status: 401
    end
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
