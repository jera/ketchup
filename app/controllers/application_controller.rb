# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation
  
  # Authentication
  before_filter :authenticate_user!
  
  layout :devise_layout
  
  def devise_layout 
    if params[:controller] =~ /password|sessions|registrations/ #or
        #(params[:controller] == 'registrations' and params[:action] == 'new')
      'guest'
    else
      'application'
    end
  end
end
