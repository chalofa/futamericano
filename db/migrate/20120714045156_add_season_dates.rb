class AddSeasonDates < ActiveRecord::Migration
  def change
    add_column :seasons, :starts_at, :datetime
    add_column :seasons, :ends_at, :datetime
  end
end
