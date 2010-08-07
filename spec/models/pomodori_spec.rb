require 'spec_helper'

describe Pomodori do
  
  fixtures :activities, :pomodoris
  before(:each) do
    @valid_attributes = {
      :start => Time.now - 25.minutes,
      :finish => Time.now,
      :internal_interrupt => 1,
      :external_interrupt => 2,
      :cancelled => false,
      :activity => activities(:create_users_model_spec)
    }
  end

  it "should create a new instance given valid attributes" do
    Pomodori.create!(@valid_attributes)
  end
  
  it "should belongs to activity" do
    pomodori = pomodoris(:create_users_model_spec_1)
    pomodori.activity.should == activities(:create_users_model_spec)
  end
  
end
