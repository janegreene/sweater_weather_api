class BackgroundFacade
  def self.fetch_background(location)
    # lat_long = Location.new(location)
    image = BackgroundService.get_image(location)
    Image.new(image, location)
  end
end
