class Route
  attr_reader :location, :id, :forecast, :routes
  def initialize(params)
    @location = params
    # @lat =
    # @lon =
    @forecast = set_forecast(params)
    @routes = nearby_routes
    @id = nil
  end

  def set_forecast(params)
    forecast = Hash.new
    result = ForecastFacade.fetch_forecast(params)
    forecast[:summary] = result.current[:weather][0][:description]
    forecast[:temperature] = result.current[:temp]
    forecast
  end

  def nearby_routes
    routes = []
    location = MapService.get_location(@location)
    lat = location[:results][0][:locations][0][:latLng][:lat]
    lon = location[:results][0][:locations][0][:latLng][:lng]
    route_data = RouteService.get_routes(lat, lon)
    route_data[:routes].each do |route|
      route_hash = Hash.new
      route_hash[:name] = route[:name]
      route_hash[:type] = route[:type]
      route_hash[:rating] = route[:rating]
      route_hash[:location] = route[:location]
      route_hash[:distance_to_route] = distance(@location, route[:longitude], route[:latitude])
      routes << route_hash
    end
    routes
  end

  def distance(location, route_lon, route_lat)
    MapService.get_distance(location, route_lon, route_lat)
  end
end
