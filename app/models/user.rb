require 'digest/md5'

class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable,
    :authentication_keys => [:username] 

  validates_presence_of :username
  validates_uniqueness_of :username
  attr_accessible :username, :email, :password, :password_confirmation
  named_scope :all, :conditions => [], :order => 'username'
  
  def picture
    "http://www.gravatar.com/avatar/" + Digest::MD5.hexdigest(self.email)
  end
  
end
