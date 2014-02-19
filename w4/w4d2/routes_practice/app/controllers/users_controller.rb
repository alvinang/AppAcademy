class UsersController < ApplicationController

  before_filter :set_user, only: [:show, :update, :destroy]


  def index
    @users = User.all
    render :json => @users
  end

  def show
    render :json => @user
  end

  def create
    user = User.new(user_params)
    if user.save
      render :json => user
    else
      render :json => user.errors.full_messages, :status => :unprocessable_entity
    end
  end

  def update
    if @user.update_attributes(user_params)
      render :json => @user
    else
      render :json => @user.errors.full_messages, :status => :unprocessable_entity
    end
  end

  def destroy
    user = @user.dup
    @user.destroy
    render :json => user
  end

  def favorites
    favorites = User.find(params[:id]).find_favorites
    render :json => favorites
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
