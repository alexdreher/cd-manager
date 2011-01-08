require 'spec_helper'

describe "albums/index.html.haml" do
  before(:each) do
    artist = stub_model(Artist,
      :name => "Artist name"
    )    
    
    assign(:albums, [
      stub_model(Album,
        :artist => artist,
        :title => "Album 1"
      ),
      stub_model(Album,
        :artist => artist,
        :title => "Album 2"
      )
    ])
  end

  it "renders a list of albums with artist name" do
    render
    rendered.should match(/Album 1/)
    rendered.should match(/Album 2/)
    rendered.should match(/Artist name/)
  end
end
