class CreateProjectsMembers < ActiveRecord::Migration
  def self.up
    create_table :projects_members, :id => false do |t|
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
    
  end

  def self.down
    drop_table :projects
  end
end
