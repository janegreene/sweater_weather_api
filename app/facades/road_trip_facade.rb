class RoadTripFacade
  def self.make_trip(params)
    route_info = MapService.get_duration(params[:origin], params[:destination])
    lat_long = Location.new(params[:destination])
    weather_info = WeatherService.get_destination_weather(lat_long.lat_lng[:lat], lat_long.lat_lng[:lng])
    RoadTrip.new(params[:origin], params[:destination], route_info, weather_info)
  end
end
