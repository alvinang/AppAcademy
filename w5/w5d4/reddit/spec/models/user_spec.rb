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

  it "should not save password" do
    FactoryGirl.create(:user)
    User.last.password.should be_nil
  end

  it "should find user from credentials" do
    testuser = FactoryGirl.create(:user)
    User.find_by_credentials(testuser.username, testuser.password).should eq(testuser)
  end

end
