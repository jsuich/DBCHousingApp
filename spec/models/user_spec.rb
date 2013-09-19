require 'spec_helper'

describe User do
  context "requires a name, an email, and a cohort to be entered" do
    it "requires a name" do
      user = User.new(cohort: "Nighthawks", email: "Corey@example.com")
      user.valid?.should == false
    end
    it "requires a cohort" do
      user = User.new(name: "Nick", email: "Nick@example.com")
      user.valid?.should == false
    end
    it "requires an email" do
      user = User.new(name: "Corey", cohort: "Dragonflies")
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
