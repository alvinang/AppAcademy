class Card < ActiveRecord::Base

  validates :title, :rank, :list_id, presence: true

  belongs_to :list
  has_one :board, through: :list
  has_many :todo_items, inverse_of: :card

  has_many :card_assignments, inverse_of: :card
  has_many :users, through: :card_assignments, source: :user, inverse_of: :cards

  accepts_nested_attributes_for :todo_items

  def as_json(options={})
    super(options.merge({ include: [:todo_items, :users, :board] }))
  end
end
