require 'rails_helper'

describe ImageFacade do
  it 'creates an image', :vcr do
    image = ImageFacade.get_image('denver,co')
    expect(image).to be_a(Image)
  end
end
