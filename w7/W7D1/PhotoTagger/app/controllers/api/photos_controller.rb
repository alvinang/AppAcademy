class Api::PhotosController < ApplicationController
  before_filter :require_current_user!, :only => [:create]

  def create
    p params
    @photo = Photo.new(photo_params)
    @photo.owner_id = current_user.id
    if @photo.save
      render :json => @photo
    else
      render(
        :json => @photo.errors.full_messages,
        :status => :unprocessible_entity
      )
    end
  end

  def index
    @photos = Photo.where("owner_id = ?", params[:user_id])
    render :json => @photos
  end
  
  def show
    @photo = Photo.find(params[:id])
    render :json => @photo
  end

  private
  def photo_params
    params.require(:photo).permit(:owner_id, :title, :url)
  end
end
