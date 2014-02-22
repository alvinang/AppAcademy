class TracksController < ApplicationController
  
  def create
    @track = Track.new(track_params)
    @track.album_id = params[:album_id]
    
    if @track.save
      flash[:notice] = "Great work! You saved a track!"
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end
  
  def destroy
    @track = Track.find_by_id(params[:id])
    @track.delete
    redirect_to :new
  end
  
  def edit
    @track = Track.find_by_id(params[:id])
    render :edit
  end
  
  def index
    @tracks = Track.all
    render :index
  end
  
  def new
    @track = Track.new
    render :new
  end
  
  def show
    @track = Track.find_by_id(params[:id])
    render :show
  end
  
  def update
    @track = Track.find_by_id(params[:id])
    
    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end
  
  private
  
  def track_params
    params.require(:track).permit(:bonus, :lyrics, :title)
  end
  
end
