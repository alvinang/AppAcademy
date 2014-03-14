class List < ActiveRecord::Base
  
  validates :title, :rank, :board_id, presence: true
  
  belongs_to :board
  has_many :cards, dependent: :destroy
end
