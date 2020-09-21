class Api::V1::ClimbingRoutesController < ApplicationController
  def index
    route = Route.new(params[:location])
    render json: ClimbingRouteSerializer.new(route)
  end
end
