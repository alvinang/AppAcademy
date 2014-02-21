class SessionsController < ApplicationController

  before_action :direct_away_from_login, only: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(session_params[:user_name], session_params[:password])
    if @user
      login_user!(@user)
      redirect_to root_url
    else
      flash.now[:errors] = ["Bad credentials"]
      render :new
    end
  end

  def destroy
    self.reset_session_token!
    session[:token] = nil
    redirect_to root_url
  end

  private

  def session_params
    params.require(:user).permit(:user_name, :password)
  end
end
