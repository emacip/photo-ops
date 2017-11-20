class PhotosController < ApplicationController
  before_action :set_photographer

  # GET /photographers/:photographer_id/photos
  def index
    json_response(@photographer.photos)
  end

  # POST /photographers/:photographer_id/photos
  def create
    @photographer.photos.create!(photo_params)
    json_response(@photographer, :created)
  end

  private

  def photo_params
    params.permit(:url, :code)
  end

  def set_photographer
    @photographer = Photographer.find(params[:photographer_id])
  end
  
end
