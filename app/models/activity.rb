class Activity < ActiveRecord::Base
  
  belongs_to :project
  has_and_belongs_to_many :users
  has_many :pomodoris, :order => :start
  
  named_scope :from_user, lambda { |username|
    { :include => [ :users, :pomodoris ], :conditions => [ 'completed=? and users.username=?', false, username ] } }
  
  def actual 
    pomodoris.size
  end
  
  def running
    pomodoris.last if not pomodoris.last.nil? and pomodoris.last.finish.nil?
  end
  
  def team?
    users.size > 1
  end
  
end
