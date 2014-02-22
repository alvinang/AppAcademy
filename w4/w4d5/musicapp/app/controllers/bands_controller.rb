class BandsController < ApplicationController
  
  def create
    @band = Band.new(band_params)
    
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
      
  end
  
  def destroy
    
  end
  
  def edit
    @band = Band.find_by_id(params[:id])
    render :edit
  end
  
  def index
    @bands = Band.all
    render :index
  end
  
  def new
    @band = Band.new
    render :new
  end
  
  def show
    @band = Band.find_by_id(params[:id])
    render :show
  end
  
  def update    
    @band = Band.find_by_id(params[:id])
    
    if @band.update_attributes(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end
  
  private
  
  def band_params
    params.require(:band).permit(:name)
  end
  
end
