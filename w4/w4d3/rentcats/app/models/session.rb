# == Schema Information
#
# Table name: sessions
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  device     :string(255)
#  token      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Session < ActiveRecord::Base

  belongs_to :user, class_name: 'Session', foreign_key: :user_id, primary_key: :id

  def reset_session_token!
    self.token = self.class.generate_session_token
    self.save!
    self.token
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def ensure_session_token
    self.token ||= self.class.generate_session_token
  end

end
