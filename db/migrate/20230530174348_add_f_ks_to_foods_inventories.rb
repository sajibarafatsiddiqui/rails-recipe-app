class AddFKsToFoodsInventories < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :foods_inventories, :foods, column: :food_id
    add_foreign_key :foods_inventories, :inventories, column: :inventory_id
  end
end
