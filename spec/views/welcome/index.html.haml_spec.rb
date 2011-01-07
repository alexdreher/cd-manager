require 'spec_helper'

describe "welcome/index.html.haml" do
  it "should display a welcome message" do
    render 
    rendered.should match(/Welcome/)
  end
end
