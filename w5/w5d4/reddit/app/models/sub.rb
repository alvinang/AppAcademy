# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  moderator_id :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

class Sub < ActiveRecord::Base
  validates :name, :moderator_id, presence: true

  belongs_to :user,
    class_name: "User",
    foreign_key: :moderator_id,
    primary_key: :id

    has_many :link_subs
    has_many :links, through: :link_subs

end
