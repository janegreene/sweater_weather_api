require 'rails_helper'

describe "Forecast API Endpoint for Location" do
  it "sends a forecast" do
      get api_v1_forecast_index_path(params: { location: "denver, co" })

      expect(response).to be_successful
      expect(response.status).to eq(200)

      forecast = JSON.parse(response.body, symbolize_names: true)
      expect(forecast).to be_a(Hash)
      expect(forecast[:data][:id]).to eq(nil)
      expect(forecast[:data][:attributes][:location]).to eq("denver, co")
      expect(forecast[:data][:attributes][:current]).to be_a(Hash)
      expect(forecast[:data][:attributes][:hourly]).to be_a(Array)
      expect(forecast[:data][:attributes][:hourly][0]).to be_a(Hash)
      expect(forecast[:data][:attributes][:hourly].length).to eq(8)
      expect(forecast[:data][:attributes][:daily]).to be_a(Array)
      expect(forecast[:data][:attributes][:daily][0]).to be_a(Hash)
      expect(forecast[:data][:attributes][:daily].length).to eq(5)
  end

  it 'returns error with invalid or empty request' do
    get '/api/v1/forecast?location='

    expect(response).to have_http_status(400)

    forecast = JSON.parse(response.body)
    expect(forecast["error"]).not_to be_empty
    expect(forecast["error"]).to eq("Invalid request or no results found.")
  end
  
end
