#-------------------------------------------------------------------------
# Each year Season (preseason, regular and playoffs)
#-------------------------------------------------------------------------

class Season < ActiveRecord::Base
  include CommonStates

  belongs_to :team
  has_many :weeks, :dependent => :destroy
  has_many :games
  belongs_to :week

  validates_uniqueness_of :year

  delegate :short, :to => :team, :prefix => :team

  default_scope order('year DESC')    #Last seasons first...
  #First season that is being played or scheduled for start (off-season)
  scope :current, where(state: ['active', 'pending']).order('year ASC').limit(1)


  def to_s
    champion = team ? ", champion is: #{team_short}" : ''
    "#{year} Season: #{state.capitalize}#{champion}"
  end

end



# == Schema Information
#
# Table name: seasons
#
#  id         :integer(4)      not null, primary key
#  year       :integer(4)      default(2011), not null
#  state      :string(255)     default("disabled"), not null
#  week_id    :integer(4)
#  team_id    :integer(4)
#  league_id  :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

