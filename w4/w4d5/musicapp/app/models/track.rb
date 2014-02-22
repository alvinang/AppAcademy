# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  bonus      :string(255)      not null
#  lyrics     :text             not null
#  title      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Track < ActiveRecord::Base  
  BONUS = ["bonus", "regular"]
  
  validates :album_id, :bonus, :lyrics, :title, presence: true
  validates :bonus, inclusion: { in: BONUS }
  
  belongs_to  :album,
              class_name: 'Album',
              foreign_key: :album_id,
              primary_key: :id

  has_one    :band, through: :album, source: :band
          
end
