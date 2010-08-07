class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.string :name, :null => false
      t.integer :estimate
      t.integer :re_estimate
      t.boolean :completed, :default => false, :null => false
      t.datetime :date
      t.boolean :today, :default => false, :null => false
      t.boolean :unplanned, :default => false, :null => false
      t.references :project
      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
