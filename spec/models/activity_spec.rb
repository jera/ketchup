require 'spec_helper'

describe Activity do
  
  fixtures :projects, :users, :activities, :activities_users, :pomodoris
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

  it "should define from_user named scope" do
    activities = Activity.from_user(users(:abacha).username)
    activities.size.should == 2
  end
  
  it "should define actual method" do
    activity = activities(:create_users_model_spec)
    activity.actual.should == 1
  end
  
  it "should define running method with running pomodori" do
    activity = activities(:integrate_with_devise)
    activity.running.should == pomodoris(:integrate_with_devise_1)
  end

  it "should define running method with no running pomodori" do
    activity = activities(:create_users_model_spec)
    puts activity.running.to_yaml
    activity.running.should be_nil
  end
  
  it "should define team method" do 
    activities(:fix_the_light).team?.should be_true
    activities(:create_users_model_spec).team?.should be_false
  end
  
end
