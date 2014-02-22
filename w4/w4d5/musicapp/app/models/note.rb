# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  track_id   :integer          not null
#  body       :text             not null
#  created_at :datetime
#  updated_at :datetime
#

class Note < ActiveRecord::Base
  validates :user_id, :track_id, :body, presence: true
  
  belongs_to  :user,
              class_name: 'User',
              foreign_key: :user_id,
              primary_key: :id
              
  belongs_to  :track,
              class_name: 'Track',
              foreign_key: :track_id,
              primary_key: :id              
              
end
