# == Schema Information
#
# Table name: cats
#
#  id         :integer          not null, primary key
#  age        :integer          not null
#  birth_date :date
#  user_id    :integer          not null
#  color      :string(255)      not null
#  name       :string(255)      not null
#  sex        :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Cat < ActiveRecord::Base
  validates :age, :color, :name, :sex, :user_id, presence: :true
  validates :color, inclusion: { in: %w(calico black white brown green), message: "- please share your cat's color with us :)" }
  validates :sex, inclusion: { in: %w(M F) }
  validates :age, numericality: { only_integer: true, message: "should only be round numbers" }

  has_many(
    :requests,
    foreign_key: :cat_id,
    primary_key: :id,
    class_name: 'CatRentalRequest',
    dependent: :destroy
  )
  belongs_to :owner, class_name: 'User', foreign_key: :user_id, primary_key: :id



end
