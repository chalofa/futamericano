class AddDefaultSortToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :default_sort, :integer, :default => 1, :null => false
  end

  def self.down
    remove_column :games, :default_sort
  end
end
