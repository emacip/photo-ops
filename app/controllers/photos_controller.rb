class PhotosController < ApplicationController
  before_action :set_photographer

  # GET /photographers/:photographer_id/photos
  def index
    json_response(@photographer.photos)
  end

  # POST /photographers/:photographer_id/photos
  def create
    @photographer.photos.create!(photo_params)

    json_response(return_code(@photographer.photos), :created)
  end

  private

  def return_code(photos)
    {
        code: photos.map(&:code)
    }
  end

  def photo_params
    params.permit(:url, :code, :image)
  end

  def set_photographer
    @photographer = Photographer.find(params[:photographer_id])
  end
  
end
