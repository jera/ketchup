require 'spec_helper'

describe ActivitiesController do

  integrate_views
  fixtures :users, :projects, :activities, :activities_users, :pomodoris
  before(:each) do
    @user = User.new(:username => 'abacha', :email => 'abacha@jera.com.br', :password => 'secret', :password_confirmation => 'secret')
    request.env['warden'].stubs(:authenticate).returns(@user)
    request.env['warden'].stubs(:authenticate!).returns(@user)
  end

  it 'should define the index action' do
    get 'index'
    assigns[:activities].size.should == 2
  end
    
end
