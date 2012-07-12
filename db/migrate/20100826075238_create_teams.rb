class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string      :name, :short, :city, :web, :stadium, :area, :null => false
      t.references  :division
      t.integer     :league_id
      t.integer     :year, :null => false
      t.string      :state, :null => false, :default => 'disabled'
      t.timestamps
    end

    add_index :teams, :short,   :unique => true
    add_index :teams, :name,    :unique => true
    add_index :teams, :league_id
    add_index :teams, :division_id
    add_index :teams, :state
  end

  def self.down
    drop_table :teams
  end
end

