class Recipe < ApplicationRecord
  belongs_to :user
  has_many :foods_recipes
  has_many :foods, through: :foods_recipes
end
