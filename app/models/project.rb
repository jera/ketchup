class Project < ActiveRecord::Base
  
  validates_presence_of [:name, :owner, :url]
  validates_uniqueness_of :url, :case_sensitive => false
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  has_and_belongs_to_many :members, :join_table => :projects_members, :class_name => 'User'
  
  def owner_id=(id)
    self.members << User.find(id)
    write_attribute(:owner_id, id)
  end
  
end
