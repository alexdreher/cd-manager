require 'spec_helper'

describe User do
  it "should respond to his artists" do
    @user = User.new
    @user.should respond_to(:artists)
  end
end
