class Food < ApplicationRecord
  validates :name, presence: true
  has_many :foods_recipes, dependent: :destroy, class_name: :FoodRecipe
  has_many :recipes, through: :foods_recipes
end
