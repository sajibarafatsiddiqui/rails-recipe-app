require 'rails_helper'

RSpec.feature 'Foods', type: :feature do
  before do
    # Create a user and sign in
    user = User.create!(name: 'Tom', email: 'tom@email.com',
                        password: '123456')
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit foods_path
  end

  scenario 'User can see their foods' do
    expect(page).to have_content('Foods')
    expect(page).to have_content('Unit')
  end

  scenario 'User can add a new food' do
    visit new_food_path
    fill_in 'Name', with: 'Apple'
    fill_in 'Price', with: 2.99
    fill_in 'Measurement unit', with: 'gram'
    fill_in 'Quantity', with: 10

    click_button 'Create Food'
    expect(page).to have_content('Apple')
  end

  scenario 'User can delete a food' do
    # Create a food for the user
    user = User.find_by(email: 'tom@email.com')
    food = Food.create!(name: 'Apple', price: 2.99, quantity: 10, measurement_unit: 'gram', user:)
    visit foods_path
    within("#food_#{food.id}") { click_button 'Remove' }
    expect(page).not_to have_content(food.name)
  end
end
