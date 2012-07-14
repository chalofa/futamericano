#-------------------------------------------------------------------------
#   Data of each Player in the league
#-------------------------------------------------------------------------

class Player < ActiveRecord::Base
  include CommonStates

  validates_uniqueness_of :name, scope: :pos, case_sensitive: false
  validates_length_of     :name,  minimum: 10
  validates_length_of     :debut, is: 4
  validates_length_of     :pos,   in: 2..3

  belongs_to  :team

end



# == Schema Information
#
# Table name: players
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     not null
#  pos        :string(255)     not null
#  debut      :integer(4)      not null
#  state      :string(255)     default("disabled"), not null
#  team_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

