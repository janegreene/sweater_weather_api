class Route
  attr_reader :location, :id, :forecast
  def initialize(params)
    @location = params
    # @lat =
    # @lon =
    @forecast = set_forecast(params)
    # @routes = nearby_routes
    @id = nil
  end

  def set_forecast(params)
    ForecastFacade.fetch_forecast(params)
  end
  # location = MapService.get_location(params[:location])
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
end
