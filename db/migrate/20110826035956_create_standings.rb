class CreateStandings < ActiveRecord::Migration
  def self.up
    create_table :standings do |t|
      t.references :season, :team
      t.integer :won, :lost, :tied, :pf, :pa, :net, :default => 0, :null => false
      t.string :won_ids, :lost_ids, :tied_ids
      t.string :week_type
      t.string :state, :null => false, :default => 'disabled'

      t.timestamps
    end

    add_index :standings, :season_id
    add_index :standings, :team_id
    add_index :standings, [:season_id, :team_id, :state]
    add_index :standings, [:season_id, :state]
  end

  def self.down
    drop_table :standings
  end
end
