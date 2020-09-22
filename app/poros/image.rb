class Image
  attr_reader :url, :id, :source, :location
  def initialize(image_data, location)
    @location = location
    @url = image_data[:webformatURL]
    @id = nil
    @source = 'Pixabay'
  end
end
