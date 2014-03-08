class FriendshipsController < ApplicationController
  def create
    sleep(2)
    @friendship = Friendship.new(
    req_friend_id: current_user.id,
    accept_friend_id: params[:user_id])

    if @friendship.save!
      redirect_to users_url
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])

    if @friendship
      @friendship.destroy!
      redirect_to :back
    else
      flash[:errors] = ["Not friends!"]
      redirect_to users_url
    end
  end


end
