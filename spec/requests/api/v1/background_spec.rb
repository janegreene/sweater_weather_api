require 'rails_helper'

describe "background API" do
  it "send a background image" do
      get api_v1_background_index_path(params: { location: "denver, co" })

      expect(response).to be_successful
      expect(response.status).to eq(200)
      background = JSON.parse(response.body, symbolize_names: true)
      expect(background).to be_a(Hash)
      expect(background[:data][:type]).to eq('background')
      expect(background[:data][:attributes]).to have_key(:url)#will it say attributes? might have to refactor
      expect(background[:data][:attributes]).to have_key(:source)
      expect(background[:data][:attributes]).to have_key(:location)
  end

  xit 'returns error with invalid or empty request' do
    get '/api/v1/background?location='

    expect(response).to have_http_status(400)

    background = JSON.parse(response.body)
    expect(background["error"]).not_to be_empty
    expect(background["error"]).to eq("Invalid request or no results found.")
  end
end
