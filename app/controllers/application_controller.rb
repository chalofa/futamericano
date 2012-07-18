#-------------------------------------------------------------------------
#   Base Controller
#-------------------------------------------------------------------------

class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  # the active week
  def find_current_week
    @week = Week.current
  end

end
