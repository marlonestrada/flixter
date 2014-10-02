class AddOriginalPostId < ActiveRecord::Migration
  def change
    add_column :posts, :original_post_id, :integer
    add_index :posts, :original_post_id
  end
end
