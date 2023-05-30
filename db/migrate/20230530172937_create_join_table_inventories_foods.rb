class CreateJoinTableInventoriesFoods < ActiveRecord::Migration[7.0]
  def change
    create_join_table :inventories, :foods do |t|
      t.integer :quantity
      
      t.index [:inventory_id, :food_id]
      t.index [:food_id, :inventory_id]
    end
  end
end
