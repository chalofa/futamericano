namespace :counters do

  desc 'Reset all counter caches for each Game'
  task :games => :environment do
    Game.find_each do |game|
      game.update_attribute :channels_count, game.channels.size

      # TODO: use the reset_counters when error is fixed:
      #   undefined method `counter_cache_column' for nil:NilClass
      #Game.reset_counters game.id, :channels
    end
  end

  task all: [:games]
end

desc 'Recalculate all the counter caches used'
task counters: 'counters:all'
