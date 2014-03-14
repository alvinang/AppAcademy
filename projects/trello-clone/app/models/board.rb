class Board < ActiveRecord::Base
  
  validates :title, presence: true
  
  has_many :board_assignments, inverse_of: :board
  has_many :members, through: :board_assignments, source: :user, inverse_of: :boards
  has_many :lists, dependent: :destroy
  has_many :cards, through: :lists
  
  
  def self.for_member(user)
    joins(:board_assignments).where("board_assignments.user_id = ?", user.id)
  end
  
  def as_json(options = {})
    super(options.merge(include: :members))
  end
end
