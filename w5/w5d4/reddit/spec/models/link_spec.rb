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

    it "should fetch comments by parent id" do
      link1 = FactoryGirl.create(:link)

      comment1 = FactoryGirl.build(:comment)
      comment2 = FactoryGirl.build(:comment)
      comment2.parent_comment_id = comment1.id
      comment3 = FactoryGirl.build(:comment)
      comment3.parent_comment_id = comment1.id
      comment4 = FactoryGirl.build(:comment)
      comment4.parent_comment_id = comment2.id

      comment1.link_id = link1.id
      comment2.link_id = link1.id
      comment3.link_id = link1.id
      comment4.link_id = link1.id

      comment1.save
      comment2.save
      comment3.save
      comment4.save

      Link1.comments_by_parent_id[comment1.id].should eq [comment2, comment3]

    end

end
