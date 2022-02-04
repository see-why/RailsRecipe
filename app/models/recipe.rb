class Recipe < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :recipe_foods, dependent: :delete_all
  has_many :foods, through: :recipe_foods
end
