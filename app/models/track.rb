class Track < ActiveRecord::Base
  belongs_to :album
  has_one :artist, :through => :album
  
  validates :title, :presence => true
  #validates :album_id, :presence => true, :on => :save
  
  # indexes for sphinx
  define_index do
    indexes title
    indexes album.artist.name
  end
end
