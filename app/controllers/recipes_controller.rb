class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods_recipes = @recipe.foods_recipes.includes(:food)
  end
end
