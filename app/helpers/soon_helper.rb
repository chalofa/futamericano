#-------------------------------------------------------------------------
#   Helper for the Soon counter until season opener
#-------------------------------------------------------------------------

module SoonHelper

  # TODO: detect season opener
  def days_to_season_start(start_date = '2012/09/05 8:30 PM ET')
    seconds = Time.zone.parse(start_date) - Time.zone.now
    (seconds / 60 / 60 / 24).to_i
  end

end
