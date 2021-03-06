#-------------------------------------------------------------------------
#   Head Coach of each team on the league
#-------------------------------------------------------------------------

class Coach < ActiveRecord::Base
  include CommonStates

  belongs_to  :team

  attr_accessible :name, :team_id, :state

  validates_uniqueness_of :name
  validates_length_of     :name, minimum: 5

end



# == Schema Information
#
# Table name: coaches
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     not null
#  team_id    :integer(4)
#  state      :string(255)     default("disabled"), not null
#  created_at :datetime
#  updated_at :datetime
#

