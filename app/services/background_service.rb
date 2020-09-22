class BackgroundService
  def self.get_image(location_params)
    location = location_params.gsub(/[,.!]/, '').split[0]
    json = JSON.parse(response(location).body, symbolize_names: true)
    json[:hits][0]
  end

  private

  def self.response(location)
    Faraday.get "https://pixabay.com/api/" do |f|
      f.params['key'] = ENV['pixabay_api_key']
      f.params['q'] = location
    end
  end
end
