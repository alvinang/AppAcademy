# == Schema Information
#
# Table name: secret_taggings
#
#  id         :integer          not null, primary key
#  secret_id  :integer          not null
#  tag_id     :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class SecretTagging < ActiveRecord::Base

  belongs_to :secret
  belongs_to :tag

end
