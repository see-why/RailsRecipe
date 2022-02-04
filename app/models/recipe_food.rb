class RecipeFood < ApplicationRecord
  validates :quantity, numericality: { only_integer: true, greated_than_or_equal_to: 0 }

  belongs_to :food
  belongs_to :recipe
end
