# == Schema Information
#
# Table name: friend_circles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class FriendCircle < ActiveRecord::Base
  validates :name, presence: true

  has_many  :friend_circle_memberships,
            :inverse_of => :friend_circle,
            :dependent => :destroy

  has_many :users, through: :friend_circle_memberships

  has_many :friend_circle_posts

  has_many :posts, through: :friend_circle_posts
end
