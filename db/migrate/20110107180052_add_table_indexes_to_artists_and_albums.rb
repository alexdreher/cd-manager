class AddTableIndexesToArtistsAndAlbums < ActiveRecord::Migration
  def self.up
    add_index :artists, :name
    add_index :artists, :user_id
    
    add_index :albums, :artist_id
    add_index :albums, :title
  end

  def self.down
    remove_index :artists, :name
    remove_index :artists, :user_id
    
    remove_index :albums, :artist_id
    remove_index :albums, :title
  end
end
