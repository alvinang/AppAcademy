# == Schema Information
#
# Table name: todos
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Todo < ActiveRecord::Base
  validates :title, presence: true
  
  has_many :comments, 
            class_name: 'TodoComment', 
            foreign_key: :todo_id,
            primary_key: :id
  
end
