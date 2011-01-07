require 'spec_helper'

describe "artists/index.html.haml" do
  before(:each) do
    assign(:artists, [
      stub_model(Artist,
        :user_id => 1,
        :name => "Name1",
        :description => "MyText"
      ),
      stub_model(Artist,
        :user_id => 1,
        :name => "Name2",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of artists" do
    render
    rendered.should match(/Name1/)
    rendered.should match(/Name2/)
    rendered.should match(/MyText/)
  end
end
