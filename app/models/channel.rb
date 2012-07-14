#-------------------------------------------------------------------------
#   Channels for games (TV and maybe radio)
#-------------------------------------------------------------------------

class Channel < ActiveRecord::Base
  include CommonStates

  has_many :channels_games
  has_many :games, through: :channels_games

  attr_accessible :name, :short, :state, :url

  validates_uniqueness_of :short
  validates_presence_of :name, :short, :state

end



# == Schema Information
#
# Table name: channels
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     not null
#  short      :string(255)     not null
#  state      :string(255)     default("disabled"), not null
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

