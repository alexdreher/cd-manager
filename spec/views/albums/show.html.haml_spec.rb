require 'spec_helper'

describe "albums/show.html.haml" do
  before(:each) do
    @album = assign(:album, stub_model(Album,
      :artist_id => 1,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
  end
end
