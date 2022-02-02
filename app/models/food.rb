class Food < ApplicationRecord
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, numericality: { only_integer: true, greated_than_or_equal_to: 0 }

  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods
  belongs_to :user
end
