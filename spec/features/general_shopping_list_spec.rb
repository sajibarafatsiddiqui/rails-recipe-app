require 'rails_helper'

RSpec.feature 'Shopping', type: :feature do
  let(:user) do
    User.create!(name: 'arafat', email: 'arafat@email.com', password: '123455')
  end

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit general_shopping_list_path
  end

  scenario 'User can see their shopping list' do
    expect(page).to have_content('Shopping List')
    expect(page).to have_content('Amount of food items to buy')
    expect(page).to have_content('Total Value of food needed')
  end

  scenario 'User can see the foods they need to buy' do
    food1 = Food.create!(user_id: user.id, name: 'Onion', measurement_unit: 'units', price: 0.1, quantity: 3)
    food2 = Food.create!(user_id: user.id, name: 'Milk', measurement_unit: 'ml', price: 0.5, quantity: 2)
    recipe1 = Recipe.create!(name: 'Recipe 1', user_id: user.id,
                             description: 'favorite', preparation_time: 60, cooking_time: 45,
                             public: false)
    recipe2 = Recipe.create!(name: 'Recipe 2', user_id: user.id,
                             description: 'favorite', preparation_time: 60, cooking_time: 45,
                             public: false)
    FoodRecipe.create!(recipe: recipe1, food: food1, quantity: 10)
    FoodRecipe.create!(recipe: recipe2, food: food2, quantity: 15)

    visit general_shopping_list_path

    expect(page).to have_content(food2.name)
    expect(page).to have_content('2')
  end
end
