class Image
  attr_reader :id, :description, :image_url, :site, :photographer, :photographer_site
  def initialize(data)
    @id = nil
    @description = data[:description]
    @image_url = data[:urls][:full]
    @site = 'www.unsplash.com'
    @photographer = data[:user][:name]
    @photographer_site = data[:user][:links][:html]
  end
end
