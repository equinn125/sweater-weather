class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description,
  :image_url,
  :site,
  :photographer,
  :photographer_site
end
