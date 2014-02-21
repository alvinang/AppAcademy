# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_reader :password
  validates :user_name, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 3, allow_nil: true }

  before_validation :ensure_session_token

  has_many :cats
  has_many :cat_rental_requests, through: :cats, source: :cat
  has_many :sessions, class_name: 'Session', foreign_key: :user_id, primary_key: :id


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by_user_name(user_name)
    user.try(:is_password?, password) ? user : nil
  end



end
