require 'rails_helper'

describe "Climbing Routes API Endpoint for Location" do
  it "sends a forecast and route info" do
    get api_v1_climbing_routes_path(params: { location: "erwin, tn" })

    expect(response).to be_successful
    expect(response.status).to eq(200)
    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:data][:attributes][:location]).to eq("erwin, tn")
    expect(json[:data][:attributes][:forecast]).to be_a(Hash)
    expect(json[:data][:attributes][:routes]).to be_a(Array)
    expect(json[:data][:attributes][:routes][0][:name]).to be_a(String)
    expect(json[:data][:attributes][:routes][0][:name]).to_not eq(nil)
    expect(json[:data][:attributes][:routes][0][:type]).to be_a(String)
    expect(json[:data][:attributes][:routes][0][:type]).to_not eq(nil)
    expect(json[:data][:attributes][:routes][0][:rating]).to be_a(String)
    expect(json[:data][:attributes][:routes][0][:rating]).to_not eq(nil)
    expect(json[:data][:attributes][:routes][0][:location]).to be_an(Array)
    expect(json[:data][:attributes][:routes][0][:location]).to_not eq(nil)
    expect(json[:data][:attributes][:routes][0][:distance_to_route]).to be_a(Float)
    expect(json[:data][:attributes][:routes][0][:distance_to_route]).to_not eq(nil)
  end
end
