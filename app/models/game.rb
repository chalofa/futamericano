#-------------------------------------------------------------------------
# Games for each season (intermediate relation between Week and Teams
#-------------------------------------------------------------------------
class Game < ActiveRecord::Base
  include CommonStates

  belongs_to :week
  belongs_to :team
  belongs_to :away_team, class_name: 'Team'
  #has_one    :progress
  has_many   :channels_games
  has_many   :channels, through: :channels_games


  default_scope order('default_sort DESC, scheduled_at ASC, channels_count DESC, id ASC')
  scope :active,   where(state: :active)
  scope :pending,  where(state: :pending)
  scope :finished, where(state: :finished)
  scope :disabled, where(state: :disabled)
  scope :not_disabled, where('state != ?', 'disabled')
  scope :not_finished, where('state != ?', 'finished').not_disabled
  scope :with_channels, where('channels_count > 0').not_finished
  scope :by_team, lambda { |short| by_any_team(short) }
  #scope :for_scores, include: [:channels, [team: :standing], [away_team: :standing], :progress]

  attr_accessible :week_id, :team_id, :away_team_id, :home_score, :away_score,
                  :state, :game_date, :scheduled_at, :time_over

  delegate :full_name, :standing, :stadium, to: :team, prefix: true
  delegate :full_name, :standing, to: :away_team, prefix: true
  delegate :down, :to_go, :yard_line, to: :progress, prefix: true, allow_nil: true


  after_create :update_sort
  state_machine do
    after_transition  do: :update_sort
  end

  class << self
    # find the game by any of the teams short name
    def by_any_team(short)
      short = short.to_s.upcase
      where('teams.short = ? OR away_teams_games.short = ?', short, short).joins(:team, :away_team)
    end
  end


  # TODO: move to a presenter?
  # translated day name
  def day_name
    I18n.t 'week_days.' + to_date(:day_name)
  end


  def result
    diff = home_score - away_score
    if diff > 0 then :home_winner
    elsif diff < 0 then :away_winner
    else :tie
    end
  rescue NoMethodError
    return
  end

  # converts the state for sorting purposes
  def state_value
    case state.to_s
    when 'finished' then 0
    when 'active' then 2
    else 1
    end
  end

  # converts the scheduled_at date to the given format (or default)
  def to_date(format = :short_date)
    scheduled_at.to_s(format)
  end

  # date and time converted to the default formats
  def to_datetime
    "#{to_date} #{to_time}"
  end

  # converts the scheduled_at date to the default time format
  def to_time
    to_date(:short_time).downcase
  end

  # update the sort field when state changes
  def update_sort
    update_attribute :default_sort, state_value
  end

end



# == Schema Information
#
# Table name: games
#
#  id             :integer         primary key
#  week_id        :integer         not null
#  team_id        :integer
#  away_team_id   :integer
#  home_score     :integer
#  away_score     :integer
#  league_id      :integer
#  state          :string(255)     default("pending"), not null
#  game_date      :date
#  scheduled_at   :timestamp
#  time_over      :boolean         default(FALSE), not null
#  created_at     :timestamp
#  updated_at     :timestamp
#  default_sort   :integer         default(1), not null
#  channels_count :integer         default(0)
#

