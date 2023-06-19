class Food < ApplicationRecord
  validates :name, presence: true
  validates :price, :quantity, numericality: { greater_than_or_equal_to: 0 }
  has_many :foods_recipes, dependent: :destroy, class_name: :FoodRecipe
  has_many :recipes, through: :foods_recipes, dependent: :destroy
  belongs_to :user, class_name: 'User'
end
