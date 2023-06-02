require 'rails_helper'

RSpec.describe 'Public Recipes Page', type: :system do
  describe 'Public Recipe /index' do
    before :each do
      @user = User.create!(name: 'sajib', email: 'sajib@gmail.com', password: '123455')
      @recipe = Recipe.create!(name: 'recipe1', preparation_time: 1, cooking_time: 2, description: 'description for the recipe',
                               public: true, user_id: @user.id)
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'sajib@gmail.com'
      fill_in 'user_password', with: '123455'
      click_button 'Log in'
      sleep(2)
      visit public_recipes_path
    end

    it 'displays the name of recipe' do
      expect(page).to have_content(@recipe.name)
    end

    it 'displays the name of the user' do
      expect(page).to have_content(@user.name)
    end

    it 'displays a text with text public' do
      expect(page).to have_content('public')
    end

  end
end