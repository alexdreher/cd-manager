require 'spec_helper'

describe "artists/edit.html.haml" do
  before(:each) do
    @artist = assign(:artist, stub_model(Artist,
      :user_id => 1,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit artist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => artist_path(@artist), :method => "post" do
      assert_select "input#artist_name", :name => "artist[name]"
      assert_select "textarea#artist_description", :name => "artist[description]"
    end
  end
end
