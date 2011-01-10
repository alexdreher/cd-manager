require 'spec_helper'

describe "layouts/application.html.haml" do
  before(:each) do
    view.controller.stub!(:user_signed_in?).and_return(false)
    render
  end
  
  it "should display a navigation bar" do 
    assert_select('div#navigation')
  end
  
  it "should display a link to artist list" do 
    assert_select('a[href=/artists]')
  end
  
  it "should display a link to albums list" do 
    assert_select('a[href=/albums]')
  end
  
  it "should display a search field" do
    assert_select("input#search")
  end
end
