require 'faker'

FactoryGirl.define do
  factory :link do
    title Faker::Internet.slug
    url Faker::Internet.url
  end

end
