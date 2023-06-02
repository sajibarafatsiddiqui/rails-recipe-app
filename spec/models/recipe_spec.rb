require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it 'validates presence of name' do
      recipe = Recipe.new(name: nil)
      expect(recipe).to_not be_valid
      expect(recipe.errors[:name]).to include("can't be blank")
    end

    it 'validates length of name' do
      recipe = Recipe.new(name: 'a' * 251)
      expect(recipe).to_not be_valid
      expect(recipe.errors[:name]).to include('is too long (maximum is 250 characters)')
    end

    it 'validates presence of description' do
      recipe = Recipe.new(description: nil)
      expect(recipe).to_not be_valid
      expect(recipe.errors[:description]).to include("can't be blank")
    end

    it 'validates presence of preparation_time' do
      recipe = Recipe.new(preparation_time: nil)
      expect(recipe).to_not be_valid
      expect(recipe.errors[:preparation_time]).to include("can't be blank")
    end

    it 'validates numericality of preparation_time' do
      recipe = Recipe.new(preparation_time: -1.0)
      expect(recipe).to_not be_valid
      expect(recipe.errors[:preparation_time]).to include('must be greater than or equal to 0')
    end

    it 'validates presence of cooking_time' do
      recipe = Recipe.new(cooking_time: nil)
      expect(recipe).to_not be_valid
      expect(recipe.errors[:cooking_time]).to include("can't be blank")
    end

    it 'validates numericality of cooking_time' do
      recipe = Recipe.new(cooking_time: -1.0)
      expect(recipe).to_not be_valid
      expect(recipe.errors[:cooking_time]).to include('must be greater than or equal to 0')
    end
  end

  describe 'associations' do
    it 'belongs to user' do
      user = User.new
      recipe = Recipe.new(user:)
      expect(recipe.user).to eq(user)
    end

    it 'has many recipe_foods' do
      recipe = Recipe.new
      recipe_food = FoodRecipe.new
      recipe.foods_recipes << recipe_food
      expect(recipe.foods_recipes).to include(recipe_food)
    end
  end
end