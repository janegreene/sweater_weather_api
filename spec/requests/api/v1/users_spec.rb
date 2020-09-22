require 'rails_helper'

describe 'User endpoint post' do
  it 'creates an account with an API key' do
    body = {
      "email": 'whatever@example.com',
      "password": 'password',
      "password_confirmation": 'password'
    }
    post '/api/v1/users', params: body.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
    expect(response).to be_successful
    expect(response.status).to eq(201)

    api_key = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:api_key]
    expect(api_key).to_not be_empty
    expect(api_key.length).to eq(36)
    expect(User.all.count).to eq(1)
  end
  context 'with invalid parameters' do
    let(:invalid_params) do
      {
        "email": 'example@example.com',
        "password": 'password',
        "password_confirmation": 'different_password'
      }
    end

    it 'cannot create a new user with invalid attributes' do
      expect { post '/api/v1/users', params: invalid_params }.to_not change(User, :count)
      expect(response).to have_http_status(404)
      expect(response.body).to eq("Password confirmation doesn't match Password")
    end
  end
end
