class ActivitiesController < ApplicationController
  
  def index
    @activities = Activity.from_user(current_user.username) 
  end
  
end
