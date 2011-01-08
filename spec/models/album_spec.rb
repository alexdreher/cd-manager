require 'spec_helper'

module AlbumSpecHelper
  def valid_album_attributes
    {
      :artist_id => 1,
      :title => "New Album"
    }
  end
end

describe Album do
  include AlbumSpecHelper
  
  before(:each) do
    @album = Album.new
  end
  
  it "should be valid with a set of valid attributes" do
    @album.attributes = valid_album_attributes
    @album.should be_valid
  end

  it "should not be valid without a name" do
    @album.attributes = valid_album_attributes.except(:title)
    @album.should_not be_valid
    @album.should have(1).error_on(:title)
  end
  
  it "should not be valid without a artist" do
    @album.attributes = valid_album_attributes.except(:artist_id)
    @album.should_not be_valid
    @album.should have(1).error_on(:artist_id)
  end

  it "should belong to an artist" do
    @album.should respond_to(:artist)
  end

  it "should respond to a user" do
    @album.should respond_to(:user)
  end
  
  it "should respond to tracks" do
    @album.should respond_to(:tracks)
  end
  
  it "should respond to comments" do
    @album.should respond_to(:comments)
  end
end
