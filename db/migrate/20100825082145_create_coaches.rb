class CreateCoaches < ActiveRecord::Migration
  def self.up
    create_table :coaches do |t|
      t.string      :name, :null => false
      t.references  :team
      t.string      :state, :null => false, :default => 'disabled'
      t.timestamps
    end

    add_index :coaches, :name, :unique => true
    add_index :coaches, :state
    add_index :coaches, :team_id
    add_index :coaches, [:state, :team_id]
  end

  def self.down
    drop_table :coaches
  end
end

