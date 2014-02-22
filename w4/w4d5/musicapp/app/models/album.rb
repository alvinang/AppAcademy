# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  recording  :string(255)      not null
#  label      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Album < ActiveRecord::Base  
  RECORDING = ["live", "studio"]
  
  validates :band_id, :recording, :label, presence: true
  validates :recording, inclusion: { in: RECORDING }
  
  has_many    :tracks,
              class_name: 'Track',
              foreign_key: :album_id,
              primary_key: :id,
              dependent: :destroy
            
  belongs_to  :band,
              class_name: 'Band',
              foreign_key: :band_id,
              primary_key: :id            
  
end
