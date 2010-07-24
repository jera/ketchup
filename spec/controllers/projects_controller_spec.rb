require 'spec_helper'

describe ProjectsController do
  integrate_views
  fixtures :users, :projects
  
  before(:each) do
    @user = User.new(:username => 'jeffmor', :email => 'jeffmor@jera.com.br', :password => 'secret', :password_confirmation => 'secret')
    request.env['warden'].stubs(:authenticate).returns(@user)
    request.env['warden'].stubs(:authenticate!).returns(@user)
  end
  
  context "Create Project" do
    it "should instantiate new project" do
      get 'new'
      assigns[:project].should_not be_nil
      assigns[:users].size.should == 3
    end
    
    it "should redirect with a notice on successful save" do
      Project.any_instance.expects(:valid?).returns(true)
      post 'create'
      assigns[:project].should_not be_new_record
      flash[:notice].should_not be_nil
      response.should redirect_to(project_path(assigns[:project]))
    end 
 
    it "should re-render template on failed save" do
      Project.any_instance.expects(:valid?).returns(false)
      post 'create'
      assigns[:project].should be_new_record
      flash[:notice].should be_nil
      response.should render_template('new')
    end

    it "should pass params to project" do
        post 'create', :project => { :name => 'Rails', :owner_id => 1 }
        assigns[:project].name.should == 'Rails'
        assigns[:project].owner_id.should == 1
      end
  end
  
  context "View Projects" do
    it "should show projects of user" do
      get 'index'
      
      assigns[:projects].size.should == 2
    end
    
    it "should show selected project" do
      get 'show', :id => 1
      assigns[:project].id.should == 1
    end
  end
  
  context "Delete Project" do
    it "should redirect with a notice on successful delete" do
      post 'destroy', :id => 1
      flash[:notice].should_not be_nil
      response.should redirect_to(projects_path)
      Project.find(:all).size.should == 1
    end
  end
  
end