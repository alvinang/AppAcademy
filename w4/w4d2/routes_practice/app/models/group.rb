# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Group < ActiveRecord::Base

  validates :name, :user_id, presence: true
  validates :user_id, uniqueness: { scope: :name }


  belongs_to  :user,
              :primary_key => :id,
              :foreign_key => :user_id,
              :class_name => 'User'

  has_many    :contact_groups,
              :primary_key => :id,
              :foreign_key => :group_id,
              :class_name => 'ContactGroup',
              :dependent => :destroy

  has_many    :contacts,
              :through => :contact_groups,
              :source => :contact


Group.valid_add?(group, contact)

  def self.valid_add?
    return false unless Group.find(group).user.all_contacts.include?(Contact.find(contact))
    true
  end
end
