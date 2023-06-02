class FoodsRecipesController < ApplicationController
    def new
        @first_user = current_user
        @user_foods = current_user.foods
        @food_recipe = FoodRecipe.new
        @recipe = Recipe.find(params[:recipe_id])
        @foods_recipes = @recipe.foods_recipes.includes(:food)
       @foods= @user_foods.where.not(id: @foods_recipes.select(:food_id))

    end
    def create
        @food_recipe = FoodRecipe.new(food_recipe_params)
        @food_recipe.recipe_id = params[:recipe_id]
        if @food_recipe.save
          redirect_to recipe_path(id: @food_recipe.recipe_id), notice: 'Recipe Food created successfully'
        elsif @food_recipe.errors.any?
          flash.now[:alert] = @food_recipe.errors.full_messages.first
        end
        # render :new, status: 400
      end

      def destroy
        @food_recipe = FoodRecipe.find(params[:id])
        if @food_recipe.destroy
          redirect_to recipe_path(@recipe_food.recipe_id), notice: 'Recipe Food was deleted successfully'
        else
          flash.now[:alert] = @recipe_food.errors.full_messages.first if @recipe_food.errors.any?
          render :new, status: 400
        end
      end

      private
    
      def food_recipe_params
        params.require(:food_recipe).permit(:recipe_id, :food_id, :quantity)
      end
    
end
