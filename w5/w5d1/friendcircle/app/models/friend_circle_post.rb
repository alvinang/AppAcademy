# == Schema Information
#
# Table name: friend_circle_posts
#
#  id               :integer          not null, primary key
#  post_id          :integer
#  friend_circle_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class FriendCirclePost < ActiveRecord::Base
  belongs_to :friend_circle
  belongs_to :post, inverse_of: :friend_circle_post

  validates :post_id, presence: true
  validates :friend_circle_id, presence: true

end
