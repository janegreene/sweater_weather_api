require 'rails_helper'

RSpec.describe RoadTripFacade do
  it "can make trip" do
    params = {
      email: 'example@example.com',
      password: 'password'
    }
    user = User.create(email: params[:email], password: params[:password])
    body = {
      "origin": 'Denver,CO',
      "destination": 'Pueblo,CO',
      "api_key": user.api_key
    }
      trip = RoadTripFacade.make_trip(body)
      expect(trip).to be_an_instance_of(RoadTrip)
  end
end
