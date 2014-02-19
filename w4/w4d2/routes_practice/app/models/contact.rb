# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  favorite   :boolean          default(FALSE)
#

class Contact < ActiveRecord::Base
  # validates :email, uniqueness: true
  validates :email, :name, :user_id, presence: true

  belongs_to  :owner,
              :foreign_key => :user_id,
              :primary_key => :id,
              :class_name => 'User'

  has_many    :contact_shares,
              :foreign_key => :contact_id,
              :primary_key => :id,
              :class_name => 'ContactShare'


  has_many    :shared_users,
              :through => :contact_shares,
              :source => :user


end
