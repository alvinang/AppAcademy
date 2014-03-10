# == Schema Information
#
# Table name: todo_comments
#
#  id         :integer          not null, primary key
#  todo_id    :integer          not null
#  content    :text             not null
#  created_at :datetime
#  updated_at :datetime
#

class TodoComment < ActiveRecord::Base
  validates :content, presence: true
  
  belongs_to :todos
end
