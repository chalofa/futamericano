class RemoveLeagueIds < ActiveRecord::Migration
  def change
    remove_column :weeks, :league_id
    remove_column :seasons, :league_id
    remove_column :teams, :league_id
  end
end
