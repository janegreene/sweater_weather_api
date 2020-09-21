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
    ForecastFacade.fetch_forecast(params)
  end

  def nearby_routes
    location = MapService.get_location(@location)
    lat = location[:results][0][:locations][0][:latLng][:lat]
    lon = location[:results][0][:locations][0][:latLng][:lng]
    RouteService.get_routes(lat, lon)
  end
end
