class DropJoinFoodInventories < ActiveRecord::Migration[7.0]
  def change
    drop_join_table :foods, :inventories
  end
end
