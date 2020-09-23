class RoadTrip
  attr_reader :origin, :destination, :duration, :temperature, :description, :id
  def initialize(origin, destination, route_info, weather_info)
    @origin = origin
    @destination = destination
    @duration = how_long(route_info)
    @temperature = get_temp(weather_info)
    @description = get_description(weather_info)
    @id = nil
  end

  def how_long(route_info)
    hours = ((route_info[:route][:time].to_f / 60) / 60).round(0)
    minutes = (route_info[:route][:time] / 60) % 60
    if hours.positive?
      "#{hours} hour(s)"
    else
      "#{minutes} minutes"
    end
  end

  def get_temp(weather_info)
    weather_info[:current][:temp]
  end

  def get_description(weather_info)
    weather_info[:current][:weather][0][:description]
  end
end
