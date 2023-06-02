require 'rails_helper'

RSpec.describe 'Recipes Page', type: :system do
  describe 'Recipe /index' do
    before :each do
      @user = User.create!(name: 'sajib', email: 'sajib@gmail.com', password: '123455')
      @recipe = Recipe.create!(name: 'recipe1', preparation_time: 1,
                               cooking_time: 2, description: 'description for the recipe',
                               public: true, user_id: @user.id)
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'sajib@gmail.com'
      fill_in 'user_password', with: '123455'
      click_button 'Log in'
      sleep(2)
      visit recipes_path
    end

    it 'displays the name of recipe' do
      expect(page).to have_content(@recipe.name)
    end

    it 'displays the description of recipe' do
      expect(page).to have_content(@recipe.description)
    end

    it 'displays a button with text Remove' do
      expect(page).to have_content('Remove')
    end
  end
end
