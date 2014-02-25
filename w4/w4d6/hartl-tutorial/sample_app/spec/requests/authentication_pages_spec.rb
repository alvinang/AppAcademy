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
      before { sign_in user }
      
      it { should have_title user.name }
      it { should have_link "Profile" , href: user_url(user) }
      it { should have_link "Settings", href: edit_user_path(user) }
      it { should have_link "Sign out", href: session_url(user) }
      it { should_not have_link "Sign in", href: new_session_url }      
    end  
  end
  
  describe "authorization" do 
    
    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      
      describe "in the Users controller" do
        
        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_title 'Sign in' }
        end
        
        describe "submitting to the update action" do
          before { patch user_path(:user) }
          specify { expect(response).to redirect_to(signin_path) }
        end        
      end
    end
    
    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: 'wrong@example.com') }
      before { sign_in user, no_capybara: true }
      
      describe "submitting a GET request to the Useres#edit action" do
        before { get edit_user_path(wrong_user) }
        specify { expect(response.body).not_to match(full_title('Edit user'))}
        specify { expect(response).to redirect_to(root_url) }
      end
      
      describe "submitting a PATCH request to the Users#update action" do
        before { patch user_path(wrong_user) }
        specify { expect(response).to redirect_to(root_user) }
      end
      
    end
    
  end  
end