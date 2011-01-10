class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :tracks
  has_many :comments, :as => :commentable
  has_one :user, :through => :artist
  
  validates :title, :presence => true
  validates :artist_id, :presence => true
  
  has_attached_file :cover, :styles => { :medium => "150x150#", :thumb => "72x72#" }
  
  accepts_nested_attributes_for :tracks, :reject_if => :all_blank
  
  # indexes for sphinx
  define_index do
    indexes title
    indexes tracks(:title), :as => :track_title
  end
end
