class WeatherService

  def self.get_weather(location)
    response = conn.get("/data/2.5/onecall") do |faraday|
      faraday.params['lat'] = location.lat_lng[:lat]
      faraday.params['lon'] = location.lat_lng[:lng]
      faraday.params["units"] = "imperial"
      faraday.params["exclude"] = "minutely"
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_destination_weather(lat, long)
    response = conn.get("/data/2.5/onecall") do |faraday|
      faraday.params['lat'] = lat
      faraday.params['lon'] = long
      faraday.params["units"] = "imperial"
      faraday.params["exclude"] = "minutely"
    end

    JSON.parse(response.body, symbolize_names: true)
  end

private

  def self.conn
    Faraday.new(url: "http://api.openweathermap.org") do |faraday|
      faraday.params["appid"] = ENV['open_weather_key']
    end
  end
end
