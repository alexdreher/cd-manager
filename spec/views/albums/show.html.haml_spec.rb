require 'spec_helper'

describe "albums/show.html.haml" do
  before(:each) do
    @album = assign(:album, stub_model(Album,
      :artist_id => 1,
      :title => "Album title",
      :released_at => "2010-12-24"
    ))
    
    @album.artist = assign(:artist, stub_model(Artist,
      :name => "Artist name"
    ))
    
    @album.tracks = assign(:track, 
      [
        stub_model(Track, :title => "Track one"),
        stub_model(Track, :title => "Track two")
      ]
    )
    
    @album.comments = assign(:comment, 
      [
        stub_model(Comment, :text => "Comment one"),
        stub_model(Comment, :text => "Comment two")
      ]
    )
    view.controller.stub!(:current_user).and_return(false)
    render
  end

  it "renders attributes" do    
    rendered.should match(/Album title/)
    rendered.should match(/Artist name/)
    rendered.should match(/2010-12-24/)
    assert_select('img[class=album_cover]')   
  end
  
  it "renders a list of tracks" do    
    rendered.should match(/Track one/)
    rendered.should match(/Track two/)
  end
  
  it "renders a list of comments" do    
    rendered.should match(/Comment one/)
    rendered.should match(/Comment two/)
  end
  
  it "show a comment Form" do    
    assert_select "form", :action => comments_path, :method => "post" do
      assert_select "textarea#comment_text", :name => "comment[text]"
    end
  end
end
