require 'spec_helper'

module TrackSpecHelper
  def valid_track_attributes
    {
      :album_id => 1,
      :title => "Track one",
      :length => 3.3
    }
  end
end

describe Track do
  include TrackSpecHelper
  
  before(:each) do
    @track = Track.new
  end
  
  it "should be valid with a set of valid attributes" do
    @track.attributes = valid_track_attributes
    @track.should be_valid
  end
  
  it "should not be valid without a title" do
    @track.attributes = valid_track_attributes.except(:title)
    @track.should_not be_valid
    @track.should have(1).error_on(:title)
  end
  
  it "should belong to an album" do
    @track.should respond_to(:album)
  end
end
