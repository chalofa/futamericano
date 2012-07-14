#-------------------------------------------------------------------------
# Each of the 8 divisions of the league (AFC and NFC)
#-------------------------------------------------------------------------

class Division < ActiveRecord::Base
  include CommonStates

  has_many :teams

  validates_uniqueness_of :name, scope: :conference
  validates_length_of     :name, in: 4..5
  validates_length_of     :conference, is: 3
  validates_uniqueness_of :position, scope: :conference

  attr_reader :full_name

  default_scope order: 'conference ASC, position'
  scope :for_standings, order('won DESC, tied DESC, net DESC, pf DESC').includes(teams: :standing).
  scope :afc, where(conference: 'AFC').for_standings
  scope :nfc, where(conference: 'NFC').for_standings


  # long division name (with the Conference name as prefix)
  def full_name
    "#{conference} #{name}"
  end

end



# == Schema Information
#
# Table name: divisions
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     not null
#  conference :string(255)     not null
#  position   :integer(4)      not null
#  state      :string(255)     default("disabled"), not null
#  created_at :datetime
#  updated_at :datetime
#

