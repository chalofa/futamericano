#-------------------------------------------------------------------------
#   Shows a reverse counter until the season opener
#-------------------------------------------------------------------------

class SoonController < ApplicationController
  before_filter :find_next_season

  def show
  end

  private
  def find_next_season
    @season = Season.next_pending
  end

end
