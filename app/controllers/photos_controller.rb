class PhotosController < ApplicationController
  before_action :set_photographer, except: [:show]
  before_action :set_photo, only: [:show]

  # GET /photographers/:photographer_id/photos
  def index
    json_response(@photographer.photos)
  end

  # GET /photographers/:photographer_id/photos/:code
  def show
    json_response(return_image(@photo.image))
  end

  # POST /photographers/:photographer_id/photos
  def create
    @photographer.photos.create!(photo_params)

    json_response(return_code(@photographer.photos), :created)
  end

  # PUT /photographers/:photographer_id/photos/:code/revoke
  def revoke
    @photographer.photos.update(photo_params)
    head :no_content
  end

  private

  def return_code(photos)
    {
        code: photos.map(&:code)
    }
  end

  def return_image(image)
    {
        image_url: image.url
    }
  end

  def photo_params
    params.permit(:url, :code, :image, :revoke)
  end

  def set_photographer
    @photographer = Photographer.find(params[:photographer_id])
  end

  def set_photo
    @photo = Photo.not_revoked.find_by(code: params[:code])
  end
  
end
