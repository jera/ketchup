require 'spec_helper'

describe Project do
  
  fixtures :users, :projects, :projects_members
  before(:each) do
    @valid_attributes = {
      :name => "Ketchup",
      :owner_id => users(:jeffmor).id,
      :url => 'ketchup',
      :description => 'Pomodoro made easy!',
      :homepage => 'http://ketchup.jera.com.br',
      :members => [ users(:brunoaa) ]
    }
  end

  it "should create a new instance given valid attributes" do
    project = Project.create!(@valid_attributes)
  end
  
  it "should belongs to owner (user)" do
    ketchup = Project.create!(@valid_attributes)
    ketchup.owner.should == users(:jeffmor)
  end
  
  it "should validate presences of name, owner and url" do
    project = Project.new
    project.should have(1).error_on(:name)
    project.should have(1).error_on(:owner) 
    project.should have(1).error_on(:url) 
  end
  
  it "should validate uniqueless of url" do
    project = Project.new projects(:tomalhando).attributes
    project.should have(1).error_on(:url)
  end
  
  it "should be invalid with differente case of url attribute" do
    project = Project.new projects(:tomalhando).attributes
    project.url = 'tomalhando'
    project.should have(1).error_on(:url)
  end
  
  it "should have many members" do
    project = projects(:tomalhando)
    project.members.size.should == 2
    project.members.index(users(:abacha)).should_not be_nil
  end
  
  it "should add owner as member automatically" do
    project = Project.new :owner_id => 1
    project.members.size.should == 1
    project.members.index(users(:jeffmor)).should_not be_nil    
  end
  
  it "should mantain old owner on change" do
    project = Project.new :owner_id => 1
    project.owner_id = 2
    project.members.index(users(:jeffmor)).should_not be_nil
  end
  
end
