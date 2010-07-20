require 'spec_helper'

describe User do
  
  fixtures :users
  before(:each) do
    @valid_attributes = {
      :username => "sauloarruda",
      :password => "secret",
      :password_confirmation => "secret",
      :email => "sauloarruda@jera.com.br"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
  
  it "should validate presences of username, email and password" do
    user = User.new
    user.should have(1).error_on(:username) 
    user.should have(1).error_on(:email)
    user.should have(1).error_on(:password)
  end
  
  it "should validate uniqueless of username" do
    user = User.new @valid_attributes
    user.username = "jeffmor"
    user.should have(1).error_on(:username)
  end
  
  it "should validate password confirmation" do
    user = User.new @valid_attributes
    user.password_confirmation = 'invalid'
    user.should have(1).error_on(:password)
  end
  
  it 'should validate e-mail address' do
    user = User.new @valid_attributes
    user.email = "invalid@email"
    user.should have(1).error_on(:email)
  end
  
  it 'should define namedscope all' do
    users = User.all
    users.size.should == 2
    users[0].should == users(:abacha)
    users[1].should == users(:jeffmor)
  end
  
end
