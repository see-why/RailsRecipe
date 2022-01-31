class Food < ApplicationRecord
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, numericality: { only_integer: true, greated_than_or_equal_to: 0 }

  has_many :recipefoods
  has_many :recipes, through: :recipefoods
  belongs_to :user
end
