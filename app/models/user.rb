class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true

  has_many :foods
  has_many :recipes
end
