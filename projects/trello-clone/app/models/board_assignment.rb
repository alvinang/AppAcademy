class BoardAssignment < ActiveRecord::Base
  
  validates :user, :board, presence: true
  
  belongs_to :user, inverse_of: :board_assignments
  belongs_to :board, inverse_of: :board_assignments
end
