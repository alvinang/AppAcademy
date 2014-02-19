# == Schema Information
#
# Table name: contact_groups
#
#  id         :integer          not null, primary key
#  contact_id :integer
#  group_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class ContactGroup < ActiveRecord::Base
  validates :contact_id, :group_id, presence: true
  validates :contact_id, uniqueness: { :scope => :group_id }

  belongs_to  :group,
              :primary_key => :id,
              :foreign_key => :group_id,
              :class_name => 'Group'

  belongs_to  :contact,
              :primary_key => :id,
              :foreign_key => :contact_id,
              :class_name => 'Contact'
end
