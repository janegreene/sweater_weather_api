require 'rails_helper'

RSpec.describe Forecast do
  it "can make forecast" do
    data = JSON.parse(File.read('spec/fixtures/weather_response.json'), symbolize_names: true)
    location = 'denver,co'
    forecast = Forecast.new(data, location)
    expect(forecast.id).to be_nil
    expect(forecast.timezone).to eq(data[:timezone])
    expect(forecast.current[:temp]).to eq(data[:current][:temp])
    expect(forecast.daily[0][:min_temp]).to eq(data[:daily][0][:temp][:min])
    expect(forecast.hourly[0][:temp]).to eq(data[:hourly][0][:temp])
  end
end
