module FriendshipsHelper

  def can_friend?(accept_friend_id)
    is_friend?(accept_friend_id) || (accept_friend_id == current_user.id)
  end

  def can_unfriend?(accept_friend_id)
    !is_friend?(accept_friend_id)
  end

  def is_friend?(accept_friend_id)
    Friendship.exists?(req_friend_id: current_user.id,
                    accept_friend_id: accept_friend_id)
  end

end
