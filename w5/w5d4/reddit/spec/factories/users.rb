require 'faker'

FactoryGirl.define do
  factory :user do
    username Faker::Internet.user_name
    password Faker::Internet.password
  end
end
