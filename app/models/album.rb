class Album < ActiveRecord::Base
  belongs_to :artist
  
  validates :title, :presence => true
  validates :artist_id, :presence => true
  
  def user
    artist.user
  end
  
  has_attached_file :cover, :styles => { :medium => "200x200#", :thumb => "50x50#" }
end
