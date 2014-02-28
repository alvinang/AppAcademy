# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  comment           :string(255)      not null
#  parent_comment_id :integer
#  link_id           :integer          not null
#  created_at        :datetime
#  updated_at        :datetime
#

require 'spec_helper'

describe Comment do

  it {should belong_to :link }
  it {should belong_to :parent }
  it {should have_many :children }

end
