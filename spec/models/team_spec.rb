require 'spec_helper'

describe Team do

  # CLASS methods
  describe '#self.find_by_short_or_name' do
    context 'when using short name' do
      before do
        Team.should_receive(:find_by_short).and_return(true)
        Team.should_not_receive(:find_by_name)
      end

      it 'should find the team' do
        Team.find_by_short_or_name('ind').should_not be_nil
      end
    end

    context 'when using team name' do
      before do
        Team.should_receive(:find_by_short).and_return(nil)
        Team.should_receive(:find_by_name).and_return(true)
      end

      it 'should find the team' do
        Team.find_by_short_or_name('colts').should_not be_nil
      end
    end

    context 'when nothing found' do
      before do
        Team.should_receive(:find_by_short).and_return(nil)
        Team.should_receive(:find_by_name).and_return(nil)
      end

      it 'should return nil' do
        Team.find_by_short_or_name(nil).should be_nil
      end
    end
  end

  # INSTANCE methods
  describe '#full_name' do
    before do
      subject.stub(city: 'CITY', name: 'NAME')
    end

    it 'should return the Team name & city' do
      subject.full_name.should == 'CITY NAME'
    end
  end

  describe '#to_s' do
    before do
      subject.stub(full_name: 'FOO BAR', short: 'FB')
    end

    it 'should show a human readable text of the Team (the full name)' do
      subject.to_s.should == 'FOO BAR (FB)'
    end
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

