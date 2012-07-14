require 'spec_helper'

describe Week do

  describe '#self.by_short' do
    before do
      Week.should_receive(:by_week_type).with('REG').and_return Week
      Week.should_receive(:by_number).with('12')
    end

    it 'should find the week' do
      Week.by_short('REG12')
    end
  end

  describe '#self.current' do
    before do
      Week.should_receive(:active).and_return [1, subject]
    end

    it 'should assign the last active week' do
      Week.current.should == subject
    end
  end

  describe '#self.find_by_short' do
    before do
      Week.should_receive(:by_short).with('SB22').and_return [subject, 'foo']
    end

    it 'should find the first element by the short name' do
      Week.first_by_short('SB22').should == subject
    end
  end

  describe '#humanize' do
    context 'when Regular week type' do
      before do
        subject.stub(week_type: 'REG', number: 1)
      end

      it 'should format properly the week name' do
        subject.humanize.should == '1'
      end
    end

    context 'when Pre-Season week type' do
      before do
        subject.stub(week_type: 'PRE', number: 1)
        I18n.should_receive(:translate).and_return 'WeekType'
      end

      it 'should format properly the week name' do
        subject.humanize.should == 'WeekType 1'
      end
    end

    context 'when PlayOffs week type' do
      before do
        subject.stub(week_type: 'POST', number: 18)
        I18n.should_receive(:translate).with('week_types.POST').and_return 'PlayOffs'
        I18n.should_receive(:translate).with('week_types.week_18').and_return 'GameName'
      end

      it 'should format properly the week name' do
        subject.humanize.should == 'PlayOffs GameName'
      end
    end

    context 'when SuperBowl' do
      before do
        subject.stub(week_type: 'SB', number: 25)
        I18n.should_receive(:translate).twice.and_return 'SuperBowl'
      end

      it 'should format properly the week name' do
        subject.humanize.should == 'SuperBowl'
      end
    end
  end

  describe '#short' do
    before do
      subject.stub week_type: 'REG', number: 1
    end

    it 'should show a small text with the week type and number' do
      subject.short.should == 'REG1'
    end
  end

  describe '#to_s' do
    before do
      subject.stub week_type: 'REG', number: 1, state: :pending
      subject.should_receive(:season_year).and_return 2000
    end

    it 'should show an humanized output of the week' do
      subject.to_s.should == '2000 @ week REG 1 is Pending'
    end
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

