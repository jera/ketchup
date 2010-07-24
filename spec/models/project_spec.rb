require 'spec_helper'

describe Project do
  
  fixtures :users, :projects
  before(:each) do
    @valid_attributes = {
      :name => "Ketchup",
      :owner_id => 1,
      :url => 'ketchup',
      :description => 'Pomodoro made easy!',
      :homepage_url => 'http://ketchup.jera.com.br'
    }
  end

  it "should create a new instance given valid attributes" do
    Project.create!(@valid_attributes)
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
  
end
