#-------------------------------------------------------------------------
# Weeks for each Season (Pre-season, regular and playoffs
#-------------------------------------------------------------------------

class Week < ActiveRecord::Base
  include CommonStates

  belongs_to  :season
  has_many    :games, dependent: :destroy
  has_many    :settings, as: :settingable

  default_scope order('season_id DESC, id ASC')
  scope :active, where(state: :active)
  scope :all_but, lambda { |week| where('id != ?', week.id)}
  scope :by_number, lambda { |number| where(number: number) }
  scope :by_season, lambda { |season| where(season: season) }
  scope :by_week_type, lambda { |week_type| where(week_type: week_type) }

  attr_accessible :season_id, :week_type, :state, :number

  #Only allow a unique week name per Season
  validates_uniqueness_of :number, scope: [:season_id, :week_type]
  validates_numericality_of :number
  validates_length_of :week_type, in: 3..4

  delegate :year, to: :season, prefix: :season, allow_nil: true


  class << self
    # find the week by the short name
    def by_short(short)
      week_type, number = short.match(/([a-zA-Z]+)(\d+)/).to_a.last(2)
      by_week_type(week_type).by_number(number)
    end

    # use most actual week (we should just have just 1 active week)
    def current
      active.last
    end

    # first week with the short
    def first_by_short(short)
      by_short(short).first
    end
  end

  # TODO: use a presenter for this?
  # human readable string
  def humanize
    week_name = I18n.translate "week_types.#{week_type}"
    game_name = I18n.translate "week_types.week_#{number}" if number > 17
    case week_type
    when 'PRE'
      "#{week_name} #{number}"
    when 'REG'
      number.to_s
    when 'POST'
      "#{week_name} #{game_name}"
    else
      game_name
    end
  end

  # Dynamic short name (for backward compatibility)
  def short
    "#{week_type}#{number}"
  end

  # week representation
  def to_s
    "#{season_year} @ week #{week_type} #{number} is #{state.capitalize}"
  end

end



# == Schema Information
#
# Table name: weeks
#
#  id         :integer(4)      not null, primary key
#  season_id  :integer(4)      not null
#  week_type  :string(255)     not null
#  state      :string(255)     default("disabled"), not null
#  number     :integer(4)
#  league_id  :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

