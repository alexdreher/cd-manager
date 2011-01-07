class CreateArtists < ActiveRecord::Migration
  def self.up
    create_table :artists do |t|
      t.integer :user_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :artists
  end
end
