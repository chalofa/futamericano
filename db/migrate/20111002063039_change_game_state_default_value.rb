class ChangeGameStateDefaultValue < ActiveRecord::Migration
  def self.up
    change_column :games, :state, :string, :default => 'pending', :null => false
  end

  def self.down
    change_column :games, :state, :string, :default => 'disabled', :null => false
  end
end
