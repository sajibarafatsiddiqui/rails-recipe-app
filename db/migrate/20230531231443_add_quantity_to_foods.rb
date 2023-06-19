class AddQuantityToFoods < ActiveRecord::Migration[7.0]
  def change
    add_column :foods, :quantity, :float
  end
end
