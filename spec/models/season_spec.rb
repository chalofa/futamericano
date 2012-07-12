require 'spec_helper'

describe Season do

  describe '#to_s' do
    context 'when a completed season' do
      before do
        subject.should_receive(:team).and_return true
        subject.stub(year: 2011, state: :finished, team_short: 'ABC')
      end

      it 'should show a humanized text with finished and the champion' do
        subject.to_s.should == '2011 Season: Finished, champion is: ABC'
      end
    end

    context 'when an active season' do
      before do
        subject.stub(year: 2012, state: :active, team: nil)
      end

      it 'should show a humanized text with the proper state' do
        subject.to_s.should == '2012 Season: Active'
      end
    end
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

