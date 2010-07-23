class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable,
    :authentication_keys => [:username] 

  validates_uniqueness_of :username
  attr_accessible :username, :email, :password, :password_confirmation
  named_scope :all, :conditions => [], :order => 'username'
  
end
