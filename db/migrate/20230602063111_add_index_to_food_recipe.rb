class AddIndexToFoodRecipe < ActiveRecord::Migration[7.0]
  def change
    remove_index :foods_recipes, [:recipe_id, :food_id]
    add_index :foods_recipes, [:recipe_id, :food_id], unique: true
  end
end
