class CreateTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
      t.integer :album_id
      t.string :title
      t.float :length
      t.integer :position

      t.timestamps
    end
    
    add_index :tracks, :title
    add_index :tracks, :album_id
  end

  def self.down
    drop_table :tracks
    
    remove_index :tracks, :title
    remove_index :tracks, :album_id
  end
end
