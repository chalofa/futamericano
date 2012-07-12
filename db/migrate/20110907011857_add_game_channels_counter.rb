class AddGameChannelsCounter < ActiveRecord::Migration
  def self.up
    add_column :games, :channels_count, :integer, :default => 0
  end

  def self.down
    remove_column :games, :channels_count
  end
end
