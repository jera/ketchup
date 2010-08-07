require 'spec_helper'

describe Activity do
  
  fixtures :projects, :users, :activities, :activities_users
  before(:each) do
    @valid_attributes = {
      :name => 'Create activity model spec',
      :estimate => 1,
      :re_estimate => nil,
      :completed => false,
      :date => nil,
      :today => false,
      :unplanned => false,
      :project => projects(:tomalhando),
      :users =>  [ users(:jeffmor) ]
    }
  end

  it "should create a new instance given valid attributes" do
    Activity.create!(@valid_attributes)
  end
  
  it "should belongs to project" do
    activity = activities(:create_users_model_spec)
    activity.project.should == projects(:tomalhando)
  end

  it "should has many users" do
    activity = activities(:create_users_model_spec)
    activity.users.size.should == 1
    activity.users.index(users(:abacha)).should_not be_nil
  end
  
end
