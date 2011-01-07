require 'spec_helper'

describe "albums/edit.html.haml" do
  before(:each) do
    assign(:album, stub_model(Album,
      :artist_id => 1,
      :title => "MyString"
    ).as_new_record)
    
    @artists = [mock_model(Artist, :user_id => 1, :name => "Name")]
    
    @current_user = mock_model(User, :id => 1)
    @current_user.stub!(:artists).and_return(@artists)
    view.stub!(:current_user).and_return(@current_user)
  end

  it "renders new album form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => albums_path, :method => "post" do
      assert_select "select#album_artist_id", :name => "album[artist_id]"
      assert_select "input#album_title", :name => "album[title]"
      assert_select "input#album_released_at", :name => "album[released_at]"
    end
  end
end
