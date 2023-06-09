require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validations' do
    it 'validates numericality of price' do
      food = Food.new(price: -1)
      expect(food).to_not be_valid
      expect(food.errors[:price]).to include('must be greater than or equal to 0')
    end

    it 'validates numericality of quantity' do
      food = Food.new(quantity: -1)
      expect(food).to_not be_valid
      expect(food.errors[:quantity]).to include('must be greater than or equal to 0')
    end
  end

  describe 'associations' do
    it 'has many recipe_foods' do
      food = Food.new
      recipe_food = FoodRecipe.new
      food.foods_recipes << recipe_food
      expect(food.foods_recipes).to include(recipe_food)
    end

    it 'belongs to user' do
      user = User.new
      food = Food.new(user_id: user.id)
      expect(food.user_id).to eq(user.id)
    end
  end
end
