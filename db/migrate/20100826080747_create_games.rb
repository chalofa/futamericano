class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.references  :week, :null => false
      t.references  :team, :away_team
      t.integer     :home_score, :away_score, :league_id
      t.string      :state, :null => false, :default => 'disabled'
      t.date        :game_date
      t.datetime    :scheduled_at
      t.boolean     :time_over, :null => false, :default => false
      t.timestamps
    end

    add_index :games, :league_id, :unique => true
    add_index :games, [:week_id, :team_id, :away_team_id], :unique => true, :name => 'by_week'
    add_index :games, :state
  end

  def self.down
    drop_table :games
  end
end

