class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.integer :owner_id
      t.string :url
      t.string :description
      t.string :homepage

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
