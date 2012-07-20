#-------------------------------------------------------------------------
#  Intermediate model for updating game's channels
#-------------------------------------------------------------------------

class ChannelsGame < ActiveRecord::Base

  belongs_to  :game, counter_cache: true
  belongs_to  :channel

  attr_accessible :game_id, :channel_id

  validates_uniqueness_of :channel_id, scope: :game_id, message: 'duplicated for this Game'

end



# == Schema Information
#
# Table name: channels_games
#
#  id         :integer         not null, primary key
#  game_id    :integer
#  channel_id :integer
#  created_at :datetime
#  updated_at :datetime
#

