# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  moderator_id :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe Sub do

  it { should belong_to :user }
  it { should have_many :link_subs }
  it { should have_many(:links).through(:link_subs) }

end
