class Api::V1::ClimbingRoutesController < ApplicationController
  def index
    route = Route.new(params[:location])
    # location = MapService.get_location(params[:location])
    # forecast = ForecastFacade.fetch_forecast(params[:location])
    # # forecast = WeatherService.get_weather(location)
    # lat = location[:results][0][:locations][0][:latLng][:lat]
    # lon = location[:results][0][:locations][0][:latLng][:lng]
    # conn = Faraday.new('https://www.mountainproject.com')
    # response = conn.get("data/get-routes-for-lat-lon") do |req|
    #    req.params[:key] = ENV["trail_api_key"]
    #    req.params[:lat] = lat
    #    req.params[:lon] = lon
    #    req.params[:maxResults] = 10
    # end
    # JSON.parse(response.body, symbolize_names: true)
    render json: ClimbingRouteSerializer.new(route)
  end
end
