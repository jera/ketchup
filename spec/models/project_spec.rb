require 'spec_helper'

describe Project do
  
  fixtures :users
  before(:each) do
    @valid_attributes = {
      :name => "Ketchup",
      :owner_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Project.create!(@valid_attributes)
  end
  
  it "should belongs to owner (user)" do
    ketchup = Project.create!(@valid_attributes)
    ketchup.owner.should == users(:jeffmor)
  end
  
  it "should validate presences of name and owner" do
    project = Project.new
    project.should have(1).error_on(:name)
    project.should have(1).error_on(:owner) 
  end
end
