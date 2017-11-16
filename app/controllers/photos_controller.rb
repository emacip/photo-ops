class PhotosController < ApplicationController
  before_action :set_photographer

  # GET /photographers/:photographer_id/photos
  def index
    json_response(@photographer.photos)
  end

  private

  def set_photographer
    @photographer = Photographer.find(params[:photographer_id])
  end

end
