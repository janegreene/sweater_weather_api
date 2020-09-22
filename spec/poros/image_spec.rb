require 'rails_helper'

RSpec.describe Image do
  it "can make an image" do
    image_data = { webformatURL: "https://pixabay.com/get/53e3d0474e55ab14f1dc846096293f7c123bdfe1504c704f752f7cd7934bc25e_640.jpg" }
    location = "denver, co"
    image = Image.new(image_data, location)
    expect(image.id).to eq(nil)
    expect(image.source).to eq('Pixabay')
    expect(image.url).to eq(image_data[:webformatURL])
    expect(image.location).to eq(location)
  end
end
