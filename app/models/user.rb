class User < ActiveRecord::Base
  
  validates_presence_of [:username, :password]
  validates_uniqueness_of :username
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_confirmation_of :password
  
  named_scope :all, :conditions => ["active=?", true], :order => 'username'
  
end
