class CreatePomodoris < ActiveRecord::Migration
  def self.up
    create_table :pomodoris do |t|
      t.datetime :start, :null => false
      t.datetime :finish
      t.integer :internal_interrupt, :null => false, :default => 0
      t.integer :external_interrupt, :null => false, :default => 0
      t.boolean :cancelled, :null => false, :default => false
      t.references :activity

      t.timestamps
    end
  end

  def self.down
    drop_table :pomodoris
  end
end
