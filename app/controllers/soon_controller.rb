#--------------------------------------------------------------------
#   Shows a reverse counter until the season opener
#--------------------------------------------------------------------

class SoonController < ApplicationController
  before_filter :find_next_season
  before_filter :find_next_game

  def show
  end

  private
  def find_next_season
    @season = Season.next_pending
  end

  def find_next_game
    # TODO: create finder scope: .next_game
    @game = @season.weeks.current.games.next_pending
  end

end
