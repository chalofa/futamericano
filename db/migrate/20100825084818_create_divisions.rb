class CreateDivisions < ActiveRecord::Migration
  def self.up
    create_table :divisions do |t|
      t.string      :name, :conference, :null => false
      t.integer     :position, :null => false
      t.string      :state, :null => false, :default => 'disabled'
      t.timestamps
    end

    add_index :divisions, :conference
    add_index :divisions, [:conference, :name], :unique => true
    add_index :divisions, [:conference, :name, :position]
  end

  def self.down
    drop_table :divisions
  end
end

