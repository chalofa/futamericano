#-------------------------------------------------------------------------
#   Each year Season (preseason, regular and playoffs)
#-------------------------------------------------------------------------

class Season < ActiveRecord::Base
  include CommonStates

  belongs_to :team
  has_many :weeks, dependent: :destroy
  has_many :games
  belongs_to :week

  default_scope order('year DESC')    # last seasons first...
  scope :current, where(state: %w(active pending)).order('year ASC').limit(1)

  attr_accessible :year, :state, :week_id, :team_id, :starts_at, :ends_at

  validates_uniqueness_of :year

  delegate :short, to: :team, prefix: :team


  def to_s
    champion = team ? ", champion is: #{team_short}" : ''
    "#{year} Season: #{state.capitalize}#{champion}"
  end

end



# == Schema Information
#
# Table name: seasons
#
#  id         :integer         not null, primary key
#  year       :integer         default(2011), not null
#  state      :string(255)     default("disabled"), not null
#  week_id    :integer
#  team_id    :integer
#  league_id  :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  starts_at  :datetime
#  ends_at    :datetime
#

