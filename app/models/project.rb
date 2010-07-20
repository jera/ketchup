class Project < ActiveRecord::Base
  
  validates_presence_of [:name, :owner]
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  
end
