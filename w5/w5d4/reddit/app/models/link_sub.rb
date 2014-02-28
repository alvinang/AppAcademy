# == Schema Information
#
# Table name: link_subs
#
#  id         :integer          not null, primary key
#  sub_id     :integer          not null
#  link_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class LinkSub < ActiveRecord::Base
  validates :sub_id, :link_id, presence: true

  belongs_to :sub
  belongs_to :link

end
