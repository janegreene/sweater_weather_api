class RouteService
  def self.get_routes(lat, lon)
    conn = Faraday.new('https://www.mountainproject.com')
     response = conn.get("data/get-routes-for-lat-lon") do |req|
        req.params[:key] = ENV["trail_api_key"]
        req.params[:lat] = lat
        req.params[:lon] = lon
        req.params[:maxResults] = 10
     end
     JSON.parse(response.body, symbolize_names: true)
  end
end
