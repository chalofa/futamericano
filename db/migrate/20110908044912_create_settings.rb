class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string        :name, :short, :settingable_type
      t.text          :the_content, :the_values, :the_hash
      t.boolean       :locked, :default => false
      t.integer       :the_value
      t.datetime      :last_at
      t.references    :settingable

      t.timestamps
    end

    add_index :settings, :settingable_id
    add_index :settings, :settingable_type
    add_index :settings, [:settingable_type, :settingable_id]
    add_index :settings, [:settingable_type, :settingable_id, :name], :unique => true
    add_index :settings, [:settingable_type, :settingable_id, :short], :unique => true
    add_index :settings, :last_at
  end

  def self.down
    drop_table :settings
  end
end
