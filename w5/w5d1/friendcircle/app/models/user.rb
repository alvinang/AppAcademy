# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  session_token   :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_reader :password
  validates :email, presence: true
  validates :password_digest, presence: true
  validates :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true}

  before_validation :ensure_session_token

  has_many  :friend_circle_memberships
  has_many  :posts
  has_many  :friend_circles

  def password=(password)
    self.password_digest= BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end

  def generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_creds(email, password)
     user = User.find_by(email: email)
     return user if user && user.is_password?(password)
     nil
  end

  def ensure_session_token
    self.session_token = generate_session_token
  end

end
