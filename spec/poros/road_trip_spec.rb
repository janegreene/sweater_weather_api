require 'rails_helper'

RSpec.describe RoadTrip do
  xit "can make a trip" do
    origin = 'Denver,CO',
    destination= 'Pueblo,CO',
    route_info = MapService.get_duration(origin, destination)
    lat_long = Location.new(destination)
    weather_info = WeatherService.get_destination_weather(lat_long.lat_lng[:lat], lat_long.lat_lng[:lng])
    trip = RoadTrip.new(origin, destination, route_info, weather_info)
    expect(trip.origin).to eq("Denver,CO")
    expect(trip.destination).to eq("Pueblo,CO")
  end
end
