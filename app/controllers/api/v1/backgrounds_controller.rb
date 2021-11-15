class Api::V1::BackgroundsController < ApplicationController
  def index
    if !params[:location].empty?
    image = ImageFacade.get_image(params[:location])
    render json: ImageSerializer.new(image).serializable_hash, status: 200
  else
    render json:  '{"error": "not_found"}', status: 404
    end
  end
end
