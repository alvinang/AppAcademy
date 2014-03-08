# == Schema Information
#
# Table name: secrets
#
#  id           :integer          not null, primary key
#  title        :string(255)      not null
#  author_id    :integer          not null
#  recipient_id :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

class Secret < ActiveRecord::Base
  belongs_to :author, :class_name => "User"
  belongs_to :recipient, :class_name => "User"

  has_many :secret_taggings

  has_many :tags,
  through: :secret_taggings,
  source: :tag

  validates :author_id, :recipient_id, :title, :presence => true

  def tag_ids=(args)

  end

end
