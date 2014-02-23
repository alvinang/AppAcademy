require 'spec_helper'

describe "Authentication" do
  
  subject { page }
  
  describe "signin" do
    before { visit new_session_url }
    
    it { should have_content "Sign in" }
    it { should have_title "Sign in" }
    
    describe "with invalid information" do
      before { click_button "Sign in" }
      
      it { should have_title "Sign in" }
      it { should have_selector "div.alert.alert-error" }
      
      describe "after visiting another page" do 
        before { click_link "Home" }
        it { should_not have_selector "div.alert.alert-error" }
      end      
    end    
    
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email", with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end
      
      it { should have_title user.name }
      it { should have_link "Profile" , href: user_url(user) }
      it { should have_link "Sign out", href: signout_url }
      it { should_not have_link "Sign in", href: new_session_url }      
    end
  
  end  
end