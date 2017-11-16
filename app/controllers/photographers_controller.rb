class PhotographersController < ApplicationController
  before_action :set_photographer, only: [:show]

  # GET /photographers
  def index
    @photographers = Photographer.all
    json_response(@photographers)
  end

  # GET /photographers/:id
  def show
    json_response(@photographer.photos)
  end

  private

  def todo_params
    # whitelist params
    params.permit(:name)
  end

  def set_photographer
    @photographer = Photographer.find(params[:id])
  end

end
