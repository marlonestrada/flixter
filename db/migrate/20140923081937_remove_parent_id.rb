class RemoveParentId < ActiveRecord::Migration
  def change
    remove_index :posts, :parent_id
    remove_column :posts, :parent_id
  end
end
