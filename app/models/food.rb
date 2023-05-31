class Food < ApplicationRecord
  validates :name, presence: true

  has_many :foods_recipes
  has_many :recipes, through: :foods_recipes
  has_many :foods_inventories
  has_many :inventories, through: :foods_inventories
end
