require 'spec_helper'

describe "comments/index.html.haml" do
  before(:each) do
    assign(:comments, [
      stub_model(Comment,
        :user_id => 1,
        :text => "MyText1",
        :commentable_id => 1,
        :commentable_type => "Commentable Type"
      ),
      stub_model(Comment,
        :user_id => 1,
        :text => "MyText2",
        :commentable_id => 1,
        :commentable_type => "Commentable Type"
      )
    ])
  end

  it "renders a list of comments" do
    render
    rendered.should match(/MyText1/)
    rendered.should match(/MyText2/)
  end
end
