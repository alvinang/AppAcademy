require 'spec_helper'

describe "Static pages" do
  subject { page }
  
  describe "Home page" do
    before { visit root_url }
    
    it { should have_content 'Sample App' }
    it { should have_title full_title('') }
    it { should_not have_title '| Home' }    
  end
  
  describe "Help page" do
    before { visit help_url }
    
    it { should have_content 'Help' }
    it { should have_title full_title('Help') }
  end
  
  describe "About page" do
    before { visit about_url }
    
    it { should have_content 'About' }
    it { should have_title full_title('About') }    
  end
  
  describe "Contact page" do 
    before { visit contact_url }
    
    it { should have_content 'Contact' }
    it { should have_title full_title('Contact') }    
  end
end