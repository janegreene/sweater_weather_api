require 'rails_helper'

describe 'Road trip endpoint post' do
  it 'creates a road trip response when given start end and key' do
    @params = {
      email: 'example@example.com',
      password: 'password'
    }
    @user = User.create(email: @params[:email], password: @params[:password])
    post "/api/v1/login?email=#{@params[:email]}&password=#{@params[:password]}"
    body = {
            "origin": "Denver,CO",
            "destination": "Pueblo,CO",
            "api_key": @user.api_key
          }

    post '/api/v1/road_trip', params: body.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
    expect(response).to be_successful
    expect(response.status).to eq(201)

    api_key = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:api_key]
    expect(api_key).to eq(@user.api_key)
    expect(api_key.length).to eq(36)
  end
end
