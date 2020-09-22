require 'rails_helper'

RSpec.describe Location do
  it "can make a location" do
    location_params = "denver, co"
    location = Location.new(location_params)
    expect(location.lat_lng).to eq({:lat=>39.738453, :lng=>-104.984853})
    expect(location.name).to eq("Denver, CO US")
  end
end
