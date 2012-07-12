class CreateSeasons < ActiveRecord::Migration
  def self.up
    create_table :seasons do |t|
      t.integer     :year, :null => false, :default => 2011
      t.string      :state, :null => false, :default => 'disabled'
      t.references  :week, :team
      t.integer     :league_id
      t.timestamps
    end

    add_index :seasons, :year, :unique => true
    add_index :seasons, :state
    add_index :seasons, [:year, :state]
    add_index :seasons, [:state, :team_id]
    add_index :seasons, :team_id
    add_index :seasons, :week_id
    add_index :seasons, :league_id
  end

  def self.down
    drop_table :seasons
  end
end

