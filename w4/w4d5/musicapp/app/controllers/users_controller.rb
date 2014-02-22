class UsersController < ApplicationController
  
  before_action :view_if_logged_in, only: [:show]
    
  def create
    @user = User.new(user_params)
    
    if @user.save
      login!(@user)
      redirect_to bands_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  def new
    @user = User.new
    render :new
  end
  
  def show
    @user = current_user
    render :show
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
  
end
