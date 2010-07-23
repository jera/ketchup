class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username, :null => false

      t.database_authenticatable
      t.confirmable
      t.recoverable
      t.registerable
      t.rememberable
      t.trackable
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
