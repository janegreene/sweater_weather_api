require 'rails_helper'

RSpec.describe 'session endpoint post' do
  before(:each) do
    @params = {
      email: 'example@example.com',
      password: 'password'
    }
    @user = User.create(email: @params[:email], password: @params[:password])
  end

  it 'creates an session with an API key happy path' do
    post "/api/v1/login?email=#{@params[:email]}&password=#{@params[:password]}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    session_response = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    expect(session_response).to have_key(:api_key)
    expect(session_response[:api_key]).to eq(@user.api_key)
  end
  context 'with invalid parameters' do
    let(:invalid_params) do
      {
        "email": 'example@example.com',
        "password": 'passwordz'
      }
    end

    it 'cannot create a new user with invalid attributes' do
      post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password'
      post '/api/v1/login', params: invalid_params
      expect(response).to have_http_status(401)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:error]).to eq("Invalid password")
      expect(json[:status]).to eq(401)
    end

    it 'cannot create a without a user' do
      no_user = {
        "email": 'nah_dog',
        "password": 'passwordz'
      }
      post '/api/v1/login', params: no_user
      expect(response).to have_http_status(404)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:error]).to eq('Invalid Credentials')
      expect(json[:status]).to eq(404)
    end
  end
end
