class Recipe < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :recipefoods
  has_many :foods, through: :recipefoods
end
