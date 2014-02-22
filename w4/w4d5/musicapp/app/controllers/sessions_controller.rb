class SessionsController < ApplicationController  
  
  before_action :view_if_logged_in, only: [:destroy]
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(
      params[:user][:email], 
      params[:user][:password]
    )    
    
    if @user
      login!(@user)
      redirect_to bands_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end    
  end
  
  def destroy
    @user = current_user
    logout!(@user)
    redirect_to root_url
  end  
  
end
