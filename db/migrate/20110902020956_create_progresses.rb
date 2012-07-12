class CreateProgresses < ActiveRecord::Migration
  def self.up

    create_table :progresses do |t|
      t.belongs_to    :game
      t.integer       :down, :to_go, :home_score, :away_score, :home_to, :away_to
      t.string        :quarter, :clock, :pos_team, :yard_line, :home_scores, :away_scores
      t.boolean       :red_zone

      t.timestamps
    end

    add_index :progresses, :game_id, :unique => true
  end

  def self.down
    drop_table :progresses
  end
end
