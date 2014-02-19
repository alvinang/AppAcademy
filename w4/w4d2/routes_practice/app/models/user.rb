# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many    :contacts,
              :foreign_key => :user_id,
              :primary_key => :id,
              :class_name => 'Contact'

  has_many    :contact_shares,
              :foreign_key => :user_id,
              :primary_key => :id,
              :class_name => 'ContactShare'

  has_many    :comments,
              :foreign_key => :user_id,
              :primary_key => :id,
              :class_name => 'Comment'

  has_many    :shared_contacts,
              :through => :contact_shares,
              :source => :contact




  def all_contacts
    comments = self.comments
    contacts = (self.contacts + self.shared_contacts).uniq
    comments.each do |comment|
      contacts.select { |contact| contact.id == comment.contact_id }[0]["comment"] = comment.comment
    end
    contacts







    # query = <<-SQL
    # SELECT
    # contacts.name, contacts.email, contacts.id
    # FROM
    # contacts
    # LEFT OUTER JOIN
    # contact_shares
    # ON
    # contacts.id = contact_shares.contact_id
    # WHERE
    # contacts.user_id = :user_id
    # OR
    # contact_shares.user_id = :user_id
    #
    # SQL
    #
    # contacts = Contact.find_by_sql( query, {:user_id => self.id} )

  end

  def find_favorites
    (self.contacts.where(:favorite => true) + self.contact_shares.where(:favorite => true).map(&:contact)).uniq
  end

end
