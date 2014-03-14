require 'bcrypt'

class User < ActiveRecord::Base
  
  validates :email, :password_digest, presence: true
  validates :email, uniqueness: true
  
  has_many :board_assignments, inverse_of: :user
  has_many :boards, through: :board_assignments, source: :board, inverse_of: :members
  
  has_many :card_assignments, inverse_of: :user
  has_many :cards, through: :card_assignments, source: :card, inverse_of: :users
  
  
  def password=(input)
    self.password_digest = BCrypt::Password.create(input)
  end
  
  def verify_password(input)
    BCrypt::Password.new(self.password_digest) == input
  end
  
  def reset_session_token!
    self.session_token = SecureRandom::base64(32)
    self.save!
    
    self.session_token
  end
  
  def as_json(options = {})
    super(options.merge({ except: :password_digest, include: :cards }))
  end
  
end
