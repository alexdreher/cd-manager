class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :user_id
      t.text :text
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps
    end
    
    add_index :comments, :user_id
    add_index :comments, :commentable_id
    add_index :comments, :commentable_type
  end

  def self.down
    remove_index :comments, :commentable_type
    remove_index :comments, :commentable_id
    remove_index :comments, :user_id
    
    drop_table :comments
  end
end