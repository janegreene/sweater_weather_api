class Api::V1::BackgroundsController < ApplicationController
  def index
    city = params[:location].split(',')[0]
    background = BackgroundService.get_image(city, params)
    if background.nil? || background.location == ''
      render json: {error: "Invalid request or no results found."}, status: 400
    else
      render json: BackgroundSerializer.new(background)
    end
  end
end
