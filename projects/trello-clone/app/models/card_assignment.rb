class CardAssignment < ActiveRecord::Base
  
  validates :user, :card, presence: true
  
  belongs_to :user, inverse_of: :card_assignments
  belongs_to :card, inverse_of: :card_assignments
end
