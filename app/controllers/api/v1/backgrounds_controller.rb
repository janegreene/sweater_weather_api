class Api::V1::BackgroundsController < ApplicationController
  def index
    background = BackgroundService.get_image(params['location'])
    if background.nil? || background.location == ''
      render json: {error: "Invalid request or no results found."}, status: 400
    else
      render json: BackgroundSerializer.new(background)
    end
  end
end
