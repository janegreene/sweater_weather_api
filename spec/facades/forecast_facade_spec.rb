require 'rails_helper'

RSpec.describe ForecastFacade do
  it "can make Forecast" do
      forecast = ForecastFacade.fetch_forecast('denver,co')
      expect(forecast).to be_an_instance_of(Forecast)
  end
end
