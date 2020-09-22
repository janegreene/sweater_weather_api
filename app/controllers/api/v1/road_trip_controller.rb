class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(trip_params[:api_key])
    if user
      #call for maps and stuff
      #if the trip is legit save it and rend the response
      render json: RoadTripSerializer.new(user), status: :created
    # else
    #   render json: user.errors.full_messages.to_sentence, status: 404
    end
  end

  private

  def trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
