# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  url        :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Link do

    it { should have_many :link_subs }
    it { should have_many :comments }
    it { should have_many(:subs).through(:link_subs) }
    
    it "knows who its owner is via inverse_of" do
      user = FactoryGirl.build(:user)
      link = user.links.new
      
      expect(link.user).to be(user)
    end

    it "should create an appropriate comments hash" do
      moderator = FactoryGirl.create(:user)
      sub = moderator.subs.create(name: "A sub!")

      link = Link.new(url: "URL", title: "TITLE")
      link.user = moderator
      link.subs = [sub]
      link.save

      comment = link.comments.build(body: "BODY")
      comment.user = moderator
      comment.save

      child_comment = comment.child_comments.build(body: "BODY 2")
      child_comment.link = link
      child_comment.user = moderator
      child_comment.save

      child_child_comment = child_comment.child_comments.build(body: "BODY 3")
      child_child_comment.link = link
      child_child_comment.user = moderator
      child_child_comment.save

      expect(link.comments_by_parent).to eq({
        nil => [comment],
        comment.id => [child_comment],
        child_comment.id => [child_child_comment]
      })
      
      # link1 = FactoryGirl.create(:link)
      # 
      # comment1 = FactoryGirl.build(:comment)
      # comment2 = FactoryGirl.build(:comment)
      # comment2.parent_comment_id = comment1.id
      # comment3 = FactoryGirl.build(:comment)
      # comment3.parent_comment_id = comment1.id
      # comment4 = FactoryGirl.build(:comment)
      # comment4.parent_comment_id = comment2.id
      # 
      # comment1.link_id = link1.id
      # comment2.link_id = link1.id
      # comment3.link_id = link1.id
      # comment4.link_id = link1.id
      # 
      # comment1.save
      # comment2.save
      # comment3.save
      # comment4.save
      # 
      # Link1.comments_by_parent_id[comment1.id].should eq [comment2, comment3]

    end

end
