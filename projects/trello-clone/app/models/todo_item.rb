class TodoItem < ActiveRecord::Base
  
  validates :title, :card, presence: true
  
  belongs_to :card, inverse_of: :todo_items
end
