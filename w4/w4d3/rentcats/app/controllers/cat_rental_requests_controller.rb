class CatRentalRequestsController < ApplicationController

  def create
    @rental = CatRentalRequest.new(rental_params)
    @rental.cat_id = params[:cat_id]
    @rental.overlapping_approved_requests
    if @rental.save
      redirect_to cat_url(@rental.cat_id)
    else
      flash.now[:errors] = @rental.errors.full_messages
      redirect_to cat_url(@rental.cat_id)
    end
  end

  def update
    @rental = CatRentalRequest.find(params[:id])
    if @rental.update_attributes(rental_params)
      redirect_to cat_url(@rental.cat_id)
    else
      flash.now[:errors] = @rental.errors.full_messages
      redirect_to cat_url(@rental.cat_id)
    end
  end

  def approve
    @rental = CatRentalRequest.find(params[:id])
    @rental.overlapping_pending_requests
    redirect_to cat_url(@rental.cat_id)
  end

  def deny
    @rental = CatRentalRequest.find(params[:id])
    @rental.deny!
    redirect_to cat_url(@rental.cat_id)
  end


  private

  def rental_params
    params.require(:cat_rental_request).permit(:start_date, :end_date, :cat_id)
  end

end
