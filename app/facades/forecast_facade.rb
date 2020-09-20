class ForecastFacade
  def self.fetch_forecast(location)
    lat_long = Location.new(location)
    forecast = WeatherService.get_weather(lat_long)
    Forecast.new(forecast, location)
  end
end
