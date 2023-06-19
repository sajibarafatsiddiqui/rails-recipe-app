class DropInventories < ActiveRecord::Migration[7.0]
  def change
    drop_table :inventories, if_exists: true, force: :cascade
  end
end
