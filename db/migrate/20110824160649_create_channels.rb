class CreateChannels < ActiveRecord::Migration
  def self.up
    create_table :channels do |t|
      t.string :name, :short, :null => false
      t.string :state, :null => false, :default => 'disabled'
      t.string :url

      t.timestamps
    end

    add_index :channels, :short, :unique => true
  end

  def self.down
    drop_table :channels
  end
end
