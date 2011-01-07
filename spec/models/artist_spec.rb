require 'spec_helper'

module ArtistSpecHelper
  def valid_artist_attributes
    {
      :user_id => 1,
      :name => "Artist"
    }
  end
end

describe Artist do
  include ArtistSpecHelper
  
  before(:each) do
    @artist = Artist.new
  end
  
  it "should be valid with a set of valid attributes" do
    @artist.attributes = valid_artist_attributes
    @artist.should be_valid
  end
  
  it "should not be valid without a name" do
    @artist.attributes = valid_artist_attributes.except(:name)
    @artist.should_not be_valid
    @artist.should have(1).error_on(:name)
  end
  
  it "should not be valid without a user" do
    @artist.attributes = valid_artist_attributes.except(:user_id)
    @artist.should_not be_valid
    @artist.should have(1).error_on(:user_id)
  end
  
  it "should belong to a user" do
    @artist.should respond_to(:user)
  end
end
