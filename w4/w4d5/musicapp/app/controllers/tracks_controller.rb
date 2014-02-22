class TracksController < ApplicationController
  
  def create
    @track = Track.new(track_params)
    @track.album_id = params[:album_id]
    
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end
  
  def destroy
    
  end
  
  def edit
    
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
    
  end
  
  private
  
  def track_params
    params.require(:track).permit(:bonus, :lyrics, :title)
  end
  
end
