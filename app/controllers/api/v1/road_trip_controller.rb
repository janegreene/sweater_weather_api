class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: trip_params[:api_key])
    if user
      trip = RoadTripFacade.make_trip(trip_params)
      render json: RoadTripSerializer.new(trip), status: :created
    else
      render json: { error: 'Invalid Credentials', status: 404 }, status: 404
    end
  end

  private

  def trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
