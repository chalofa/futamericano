class CreateChannelsGames < ActiveRecord::Migration
  def self.up
    create_table :channels_games do |t|
      t.belongs_to :game
      t.belongs_to :channel

      t.timestamps
    end

    add_index :channels_games, :game_id
    add_index :channels_games, :channel_id
    add_index :channels_games, [:game_id, :channel_id], :unique => true
  end

  def self.down
    drop_table :channels_games
  end
end
