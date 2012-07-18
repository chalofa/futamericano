#-------------------------------------------------------------------------
# Channels page (TV Guide)
#-------------------------------------------------------------------------

class ChannelsController < ApplicationController
  before_filter :find_current_week, only: :show
  before_filter :find_channels, only: :show

  def show
  end


  private

  # current week channels, or empty if no available week
  def find_channels
    @channels = @week ? @week.games_with_channels : []
  end

end
