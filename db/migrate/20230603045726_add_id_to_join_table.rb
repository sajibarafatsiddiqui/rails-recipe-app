class AddIdToJoinTable < ActiveRecord::Migration[7.0]
  def change
    add_column :foods_recipes, :id, :primary_key
  end
end
