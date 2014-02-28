# == Schema Information
#
# Table name: link_subs
#
#  id         :integer          not null, primary key
#  sub_id     :integer          not null
#  link_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe LinkSub do

  it { should belong_to :link }
  it { should belong_to :sub }

end
