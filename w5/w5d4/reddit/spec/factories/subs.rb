require 'faker'

FactoryGirl.define do
  factory :sub do
    name Faker::Commerce.product_name
  end
end
