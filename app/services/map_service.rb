class MapService
  def self.get_location(city)
    response = Faraday.get('https://www.mapquestapi.com/geocoding/v1/address') do |faraday|
        faraday.params['key'] = ENV['mapquest_api_key']
        faraday.params['location'] = city
        faraday.params['outFormat'] = 'json'
    end
    JSON.parse(response.body, symbolize_names: true)#[:results][0][:locations][0][:latLng]
  end
end
