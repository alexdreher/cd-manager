require 'spec_helper'

describe Comment do
  before(:each) do
    @comment = Comment.new
  end
  
  it "should respond to a commentable" do
    @comment.should respond_to(:commentable)
  end
end
