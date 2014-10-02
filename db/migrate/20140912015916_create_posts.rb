class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :topic_id
      t.integer :parent_id

      t.timestamps
    end
    add_index :posts, :topic_id
    add_index :posts, :parent_id
  end
end
