class ImageFacade
  class << self
    def get_image(location)
      image_data = ImageService.get_image(location)[:results][0]
      Image.new(image_data)
    end
  end
end
