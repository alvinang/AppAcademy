# == Schema Information
#
# Table name: friendships
#
#  id               :integer          not null, primary key
#  req_friend_id    :integer          not null
#  accept_friend_id :integer          not null
#  created_at       :datetime
#  updated_at       :datetime
#

class Friendship < ActiveRecord::Base

  belongs_to :user,
      class_name: 'User',
      foreign_key: :req_friend_id,
      primary_key: :id

  belongs_to :user,
      class_name: 'User',
      foreign_key: :accept_friend_id,
      primary_key: :id

end
