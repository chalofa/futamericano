class CreateWeeks < ActiveRecord::Migration
  def self.up
    create_table :weeks do |t|
      t.references  :season, :null => false
      t.string      :week_type, :null => false
      t.string      :state, :null => false, :default => 'disabled'
      t.integer     :number, :league_id
      t.timestamps
    end

    add_index :weeks, [:season_id, :week_type, :number], :unique => true
    add_index :weeks, [:season_id, :week_type, :state]
    add_index :weeks, [:season_id, :week_type, :number, :state]
    add_index :weeks, :league_id, :unique => true
  end

  def self.down
    drop_table :weeks
  end
end

