require 'spec_helper'

describe User do
  context "requires an email address" do
    it "requires an email" do
      user = User.new(name: "Corey")
      user.valid?.should == false
    end
  end

  describe "#belongs_to" do
    it "belongs to a location" do
      user = User.new
      user.should respond_to(:location)
    end
  end
end
