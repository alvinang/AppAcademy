# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  url        :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Link < ActiveRecord::Base
  validates :title, :url, :user, presence: true

  has_many :link_subs
  has_many :comments
  has_many :subs , through: :link_subs, source: :sub

  def comments_by_parent_id
    comments_by_parents = Hash.new { |h,k| h[k] = [] }

    self.comments.each do |comment|
        hash[comment.parent_comment_id] << comment
    end
    comments_by_parents
  end

end
