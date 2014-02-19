# == Schema Information
#
# Table name: contact_shares
#
#  id         :integer          not null, primary key
#  contact_id :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  favorite   :boolean          default(FALSE)
#

class ContactShare < ActiveRecord::Base
  validates :contact_id, :user_id, presence: true
  validates :user_id, uniqueness: { scope: :contact_id }

  belongs_to  :user,
              :foreign_key => :user_id,
              :primary_key => :id,
              :class_name => 'User'

  belongs_to  :contact,
              :foreign_key => :contact_id,
              :primary_key => :id,
              :class_name => 'Contact'



end
