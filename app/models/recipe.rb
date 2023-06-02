class Recipe < ApplicationRecord
  belongs_to :user
  has_many :foods_recipes, dependent: :destroy, class_name: :FoodRecipe
  has_many :foods, -> { distinct }, through: :foods_recipes
end
