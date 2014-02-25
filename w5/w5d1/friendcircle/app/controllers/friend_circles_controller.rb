class FriendCirclesController < ApplicationController

  def new
    @friend_circle = FriendCircle.new
    render :new
  end

  def show
    @friend_circle = FriendCircle.find(params[:id])
  end

  def create
    @friend_circle = current_user.friend_circle.new(friend_circle_params)
    @friend_circle.user_ids = friend_circle_membership_params

    if @friend_circle.save
      redirect_to friend_circle_url(@friend_circle)
    else
      flash.now[:errors] = @friend_circle.errors.full_messages
      render :new
    end
  end

  private

  def friend_circle_params
    params.require(:friend_circle).permit(:name)
  end

  def friend_circle_membership_params
    params.permit(:friend_circle_memberships => { :user_ids => [] })
      .require(:friend_circle_memberships)
      .require(:user_ids)
  end

end
