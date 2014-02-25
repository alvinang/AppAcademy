# == Schema Information
#
# Table name: friend_circle_memberships
#
#  id               :integer          not null, primary key
#  friend_circle_id :integer
#  user_id          :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class FriendCircleMembership < ActiveRecord::Base
  validates :friend_circle, :user_id, presence: true

  belongs_to  :friend_circle

  belongs_to  :user

end
