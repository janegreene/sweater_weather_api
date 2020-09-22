class BackgroundService
  def self.get_image(location_params)
    location = location_params.gsub(/[,.!]/, '').split[0]
    json = JSON.parse(response(location).body, symbolize_names: true)
    image_data = json[:hits][0]
    if image_data.nil?
      nil
    else
      Image.new(image_data, location_params)
    end
  end

  private

  def self.response(location)
    Faraday.get "https://pixabay.com/api/" do |f|
      f.params['key'] = ENV['pixabay_api_key']
      f.params['q'] = location
    end
  end
end
