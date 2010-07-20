require 'spec_helper'

describe UsersController do

  context "Register" do
    
    before(:all) do
      @params = { :user => { :username => 'sauloarruda', 
        :email => 'saulo@jera.com.br', :password => 'secret',
        :password_confirmation => 'secret' } }
    end

    it "should instantiate new user object" do
      get 'new'
      assigns[:user].should_not be_nil
      response.should render_template('new')
    end
    
     it "should redirect with a notice on successful save" do
        post 'create', @params
        puts assigns[:user].to_yaml
        #assigns[:user].should_not be_new_record TODO verificar esse teste
        flash[:notice].should_not be_nil
        response.should redirect_to(root_path)
      end 

      it "should re-render template on failed save" do
        post 'create'
        assigns[:user].should be_new_record
        flash[:notice].should be_nil
        response.should render_template('new')
      end

      it "should pass params to project" do
          post 'create', @params
          assigns[:user].username.should == 'sauloarruda'
        end
  end
end
