require 'rails_helper'

describe "Climbing Routes API Endpoint for Location" do
  it "sends a forecast and route info" do
    get api_v1_climbing_routes_path(params: { location: "erwin, tn" })

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end
end
# {
#   "data": {
#     "id": "null",
#     "type": "climbing route",
#     "attributes": {
#       "location": "erwin,tn",
#       "forecast": {
#         "summary": "Raining cats and dogs",
#         "temperature": "65"
#       },
#       "routes": [
#         {
#           "name": "Dopey Duck",
#           "type": "Trad",
#           "rating": "5.9",
#           "location": [
#             "North Carolina",
#             "2. Northern Mountains Region",
#             "Linville Gorge",
#             "Shortoff Mountain"
#           ]
#           "distance_to_route": "76.876"
#         },
#         {
#           "name": "Straight and Narrow",
#           "type": "Trad"
#           "rating": "5.10a"
#           "location": [
#             "North Carolina",
#             "2. Northern Mountains Region",
#             "Linville Gorge",
#             "Shortoff Mountain"
#           ]
#           "distance_to_route": "76.876"
#         },
#         {...}
#       ]
#     }
#   }
# }
