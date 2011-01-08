class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :tracks
  has_many :comments, :as => :commentable
  
  validates :title, :presence => true
  validates :artist_id, :presence => true
  
  def user
    artist.user
  end
  
  has_attached_file :cover, :styles => { :medium => "200x200#", :thumb => "50x50#" }
  
  accepts_nested_attributes_for :tracks, :reject_if => :all_blank
end
