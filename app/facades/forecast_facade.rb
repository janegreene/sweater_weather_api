class ForecastFacade
  def self.fetch_forecast(location)
    lat_long = Location.new(location)
    if lat_long.name.nil?
      nil
    else
      forecast = WeatherService.get_weather(lat_long)
      Forecast.new(forecast, location)
    end
  end
end
