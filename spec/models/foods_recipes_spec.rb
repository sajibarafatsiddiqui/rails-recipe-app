require 'rails_helper'

RSpec.describe FoodRecipe, type: :model do
  describe 'associations' do
    it 'belongs to recipe' do
      recipe = Recipe.new
      recipe_food = FoodRecipe.new(recipe:)
      expect(recipe_food.recipe).to eq(recipe)
    end

    it 'belongs to food' do
      food = Food.new
      recipe_food = FoodRecipe.new(food:)
      expect(recipe_food.food).to eq(food)
    end
  end
end
