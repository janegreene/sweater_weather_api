class Api::V1::ClimbingRoutesController < ApplicationController
  def index
    lat = 40.03
    lon = 105.25
    conn = Faraday.new('https://www.mountainproject.com')
    response = conn.get("data/get-routes-for-lat-lon") do |req|
       req.params[:key] = ENV["trail_api_key"]
       req.params[:lat] = lat
       req.params[:lon] = lon
    end
    require "pry"; binding.pry
  end
end
