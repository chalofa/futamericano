class RemoveUsersTodo < ActiveRecord::Migration
  def up
    puts "DELETE THIS FAKE MIGRATION!!!!" #TODO: remove me
    puts 'rake db:migrate:down VERSION=20110317211338'
  end

  def down
    drop_table :users if table_exists?(:users)
  end
end
