class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string      :name, :pos, :null => false
      t.integer     :debut, :null => false
      t.string      :state, :null => false, :default => 'disabled'
      t.references  :team
      t.timestamps
    end

    add_index :players, [:name, :pos], :unique => true
    add_index :players, :name
    add_index :players, :pos
    add_index :players, :state
    add_index :players, :team_id
  end

  def self.down
    drop_table :players
  end
end

