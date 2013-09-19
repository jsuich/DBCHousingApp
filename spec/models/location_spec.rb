require 'spec_helper'

describe Location do
  context "requires a street address, city, state, and zip" do
    it "requires a street" do
      location = Location.new(city: "Chicago", state: "IL", zip: "60654")
      location.valid?.should == false
    end
    it "requires a city" do
      location = Location.new(street_address: "1 something st.", state: "IL", zip: "60654")
      location.valid?.should == false
    end
    it "requires a state" do
      location = Location.new(street_address: "1 something st.", city: "Chicago", zip: "60654")
      location.valid?.should == false
    end
    it "requires a zip" do
      location = Location.new(street_address: "1 something st.",  city: "Chicago", state: "IL")
      location.valid?.should == false
    end
  end

  describe "#users" do
    it "has many users" do
      location = Location.new
      location.should respond_to(:users)
    end
  end
end
