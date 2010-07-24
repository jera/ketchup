class Project < ActiveRecord::Base
  
  validates_presence_of [:name, :owner, :url]
  validates_uniqueness_of :url, :case_sensitive => false
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  
end
