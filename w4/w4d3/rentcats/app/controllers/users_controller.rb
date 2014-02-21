class UsersController < ApplicationController

    before_action :direct_away_from_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login_user!(@user)
      flash.now[:notice] = "Welcome bro!"
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end
