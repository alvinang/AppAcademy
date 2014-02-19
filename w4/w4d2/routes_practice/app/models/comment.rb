# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  comment    :string(255)
#  user_id    :integer
#  contact_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
  validates :comment, :user_id, :contact_id, presence: true
  validates :user_id, uniqueness: { :scope => :contact_id }

  belongs_to  :user,
              :foreign_key => :user_id,
              :primary_key => :id,
              :class_name => 'User'


  belongs_to  :contact,
              :foreign_key => :contact_id,
              :primary_key => :id,
              :class_name => 'Contact'


end
