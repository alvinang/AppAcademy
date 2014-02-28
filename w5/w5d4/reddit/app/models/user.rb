# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  password_digest :string(255)
#  session_token   :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_reader :password
  validates :username, :password_digest, :session_token, presence: true
  before_validation :ensure_session_token

  has_many :subs,
  class_name: "Sub",
  foreign_key: :moderator_id,
  primary_key: :id

  def password=(secret)
    self.password_digest = BCrypt::Password.create(secret)
    @password = secret
  end

  def is_password?(secret)
    BCrypt::Password.new(self.password_digest).is_password?(secret)
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save
    self.session_token
  end

  def ensure_session_token
    self.session_token = self.class.generate_session_token
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if user.is_password?(password)
      user
    else
      nil
    end
  end

end
