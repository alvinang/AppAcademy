class UsersController < ApplicationController
  
  before_action :view_if_logged_in, only: [:show]
  
  def activate
    if self.activation_token
      self.activate = true
      login!(@user)
      redirect_to bands_url
    else
      flash.now[:errors] = @user.errors.full_messages
      redirect_to root_url
    end
  end
    
  def create
    @user = User.new(user_params)
    
    if @user.save
      login!(@user)
      msg = UserMailer.welcome_email(@user)
      msg.deliver!
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
