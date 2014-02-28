# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  comment           :string(255)      not null
#  parent_comment_id :integer
#  link_id           :integer          not null
#  created_at        :datetime
#  updated_at        :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :link

  belongs_to :parent,
    class_name: 'Comment',
    foreign_key: :parent_comment_id,
    primary_key: :id

  has_many :children,
    class_name: 'Comment',
    foreign_key: :parent_comment_id,
    primary_key: :id

end
