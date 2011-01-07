class Track < ActiveRecord::Base
  belongs_to :album
  
  validates :title, :presence => true
  #validates :album_id, :presence => true, :on => :save
end
