#-------------------------------------------------------------------------
#   Team information
#-------------------------------------------------------------------------

class Team < ActiveRecord::Base
  include CommonStates

  belongs_to  :division
  has_one     :coach
  has_one     :standing, conditions: ['standings.state = ?', 'active']
  has_many    :standings
  has_many    :players

  scope :division_order, order('conference, position, teams.name').includes(:division)
  scope :afc, where(['divisions.conferwence = ?', 'AFC']).includes(:division)
  scope :nfc, where(['divisions.conference = ?', 'NFC']).includes(:division)
  scope :active, where(state: :active)
  scope :active_with_coaches, active.includes(:coach)

  attr_accessible :name, :short, :city, :web, :stadium, :area, :division_id,
                  :year, :state
  attr_reader :full_name

  validates_uniqueness_of :name, :short
  validates_length_of :short, in: 2..3


  class << self
    # finds by short, but if it couldn't be found, try with the name
    def find_by_short_or_name(search)
      find_by_short(search) || find_by_name(search)
    end
  end

  # team full name (depend from i18n?)
  def full_name
    "#{city} #{name}"
  end

  # humanized output
  def to_s
    "#{full_name} (#{short})"
  end

end



# == Schema Information
#
# Table name: teams
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)     not null
#  short       :string(255)     not null
#  city        :string(255)     not null
#  web         :string(255)     not null
#  stadium     :string(255)     not null
#  area        :string(255)     not null
#  division_id :integer(4)
#  league_id   :integer(4)
#  year        :integer(4)      not null
#  state       :string(255)     default("disabled"), not null
#  created_at  :datetime
#  updated_at  :datetime
#

