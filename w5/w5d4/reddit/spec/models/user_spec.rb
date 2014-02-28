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

require 'spec_helper'

describe User do

  it { should have_many :subs }
  it { should have_many :links }

  it "should not save password" do
    FactoryGirl.create(:user)
    User.last.password.should be_nil
  end

  it "should find user from credentials" do
    testuser = FactoryGirl.create(:user)
    User.find_by_credentials(testuser.username, testuser.password).should eq(testuser)
  end
  
  it "should create a password digest when a password is given" do
    user = FactoryGirl.build(:user)
    
    expect(user.password_digest).to_not be_nil
  end
  
  it "should create a session token after initialization of a user object" do
    user = FactoryGirl.build(:user)
    
    expect(user.session_token).to_not be_nil
  end
  
  it "should reset session token when asked" do
    user = FactoryGirl.create(:user)
    old_session_token = user.session_token
    user.reset_session_token!
    
    expect(user.session_token).to_not eq(old_session_token)
  end
  
  it "should correctly verify a user's password" do
    user = FactoryGirl.build(:user, password: "password")
    
    expect(user.is_password?("password")).to be_true
  end

end
