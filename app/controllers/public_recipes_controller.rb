class PublicRecipesController < ApplicationController
    
        def index
          @user = current_user
          @users = User.all
          @public_recipes = Recipe.includes(%i[foods_recipes user]).where(public: true).order(created_at: :desc)
        end
end
