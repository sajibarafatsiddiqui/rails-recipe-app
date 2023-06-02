class Recipe < ApplicationRecord
  belongs_to :user
  has_many :foods_recipes, dependent: :destroy, class_name: :FoodRecipe
  has_many :foods, -> { distinct }, through: :foods_recipes
  validates :name, presence: true, length: { in: 2..250 }
  validates :description, presence: true
  validates :preparation_time, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0 }
end
