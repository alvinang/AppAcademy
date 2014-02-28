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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    body {Faker::Lorem.sentence}
  end
end
