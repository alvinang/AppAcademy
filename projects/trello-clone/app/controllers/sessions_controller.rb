class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:user][:email])
    
    if user && user.verify_password(params[:user][:password])
      user.reset_session_token!
      session[:session_token] = user.session_token
      
      redirect_to root_url
    else
      render :json => "Invalid login."
    end
  end
  
  def destroy
    user = current_user
    
    if user.nil?
      redirect_to new_session_url
      return
    end
    
    session[:session_token] = nil
    user.session_token = nil
    user.save!
  
    redirect_to new_session_url
  end
end
