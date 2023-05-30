class AddFKsToFoodsRecipes < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :foods_recipes, :foods, column: :food_id
    add_foreign_key :foods_recipes, :recipes, column: :recipe_id
  end
end
