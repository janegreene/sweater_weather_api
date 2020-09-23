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
      "origin": 'Denver,CO',
      "destination": 'Pueblo,CO',
      "api_key": @user.api_key
    }

    post '/api/v1/road_trip', params: body.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
    expect(response).to be_successful
    expect(response.status).to eq(201)

    trip = JSON.parse(response.body, symbolize_names: true)
    expect(trip[:data]).to be_a(Hash)
    expect(trip[:data][:type]).to eq('road_trip')
    expect(trip[:data][:attributes][:origin]).to eq('Denver,CO')
    expect(trip[:data][:attributes][:destination]).to eq('Pueblo,CO')
    expect(trip[:data][:attributes][:temperature]).to be_a(Float)
    expect(trip[:data][:attributes][:description]).to be_a(String)
  end
  it 'returns error without user' do
    post "/api/v1/road_trip?origin=denver,co&destination=pueblo,co&api_key=#api_key"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:status]).to eq(404)
    expect(json[:error]).to eq('Invalid Credentials')
  end
end
