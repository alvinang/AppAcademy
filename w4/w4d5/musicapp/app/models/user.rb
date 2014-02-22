# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_reader :password
  
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  
  before_validation :ensure_session_token
  before_validation :ensure_activation_token
  
    
  has_many    :notes,
              class_name: 'Note',
              foreign_key: :user_id,
              primary_key: :id  
              
    
  
  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end
  
  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token    
  end
  
  def password=(secret)
    @password = secret
    self.password_digest = BCrypt::Password.create(secret)    
  end
  
  def is_password?(secret)
    BCrypt::Password.new(self.password_digest).is_password?(secret)
  end
  
  # use credentials to see if user exist
  def self.find_by_credentials(email, pass)
    user = User.find_by_email(email)
    user.try(:is_password?, pass) ? user : nil
  end
  
  def ensure_session_token
    self.session_token = self.class.generate_session_token
  end
  
  def ensure_activation_token
    self.activation_token = self.class.generate_session_token
  end
end
