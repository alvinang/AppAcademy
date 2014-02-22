class AlbumsController < ApplicationController
  
  def create
    @album = Album.new(album_params)    
    @album.band_id = params[:band_id]
    
    if @album.save
      flash[:notice] = "Great work! You saved an album!"
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end    
  end
  
  def destroy
    
  end
  
  def edit
    @album = Album.find_by_id(params[:id])
    render :edit
  end
  
  def index
    @albums = Album.all
    render :index
  end
  
  def new
    @album = Album.new
    render :new
  end
  
  def show
    @album = Album.find_by_id(params[:id])
    render :show
  end
  
  def update
    @album = Album.find_by_id(params[:id])
    
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end
  
  private
  
  def album_params
    params.require(:album).permit(:recording, :label)
  end
  
end
