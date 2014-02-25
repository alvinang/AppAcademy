# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  validates :title, :body, :user_id, presence: true

  belongs_to :user
  has_many   :links, inverse_of: :post

  has_many :friend_circle_posts, inverse_of: :post
  has_many :friend_circles, through: :friend_circle_posts


end
