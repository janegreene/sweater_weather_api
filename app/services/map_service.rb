class MapService
  def self.get_location(city)
    response = Faraday.get('https://www.mapquestapi.com/geocoding/v1/address') do |faraday|
        faraday.params['key'] = ENV['mapquest_api_key']
        faraday.params['location'] = city
        faraday.params['outFormat'] = 'json'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
  def self.get_distance(start, toLat, toLon)
    # final = [toLat, toLon].join(',').to_s
    # final = [toLat.to_s, toLon.to_s].join(',')
    final = [toLon.to_s, toLat.to_s].join(',')
    response = Faraday.get('https://www.mapquestapi.com/directions/v2/route?') do |faraday|
        faraday.params['key'] = ENV['mapquest_api_key']
        faraday.params[:from] = start
        faraday.params[:to] = final
        end
        json = JSON.parse(response.body, symbolize_names: true)
        json[:route][:distance]
  end
end
