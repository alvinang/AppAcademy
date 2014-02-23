class SessionsController < ApplicationController
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = "Invalid email/password combination"
      render :new
    end
    
  end
  
  def destroy
    
  end
end
