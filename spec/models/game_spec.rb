require 'spec_helper'

describe Game do

  describe 'self#by_any_team' do
    before do
      Game.should_receive(:where).and_return Game
      Game.should_receive(:joins).with(:team, :away_team).and_return :found
    end

    it 'should find the team if home or away' do
      Game.by_any_team('FOO').should == :found
    end
  end

  describe '#day_name' do
    before do
      subject.should_receive(:to_date).with(:day_name).and_return 'foo'
      I18n.should_receive(:t).with('week_days.foo').and_return 'translated'
    end

    it 'should return a humanized and translated day name' do
      subject.day_name.should == 'translated'
    end
  end

  describe '#result' do
    context 'when home team wins' do
      before { subject.stub home_score: 10, away_score: 3 }

      specify do
        subject.result.should == :home_winner
      end
    end

    context 'when away team wins' do
      before { subject.stub home_score: 7, away_score: 30 }

      specify do
        subject.result.should == :away_winner
      end
    end

    context 'when a tie' do
      before { subject.stub home_score: 0, away_score: 0 }

      specify do
        subject.result.should == :tie
      end
    end

    context 'when nil scores' do
      it 'should return nil' do
        subject.result.should be_nil
      end
    end
  end

  describe '#state_value' do
    context 'when finished' do
      it 'should be 0' do
        subject.stub state: 'finished'
        subject.state_value.should == 0
      end
    end

    context 'when active' do
      it 'should be 2' do
        subject.stub state: 'active'
        subject.state_value.should == 2
      end
    end

    context 'when something pending' do
      it 'should be 1' do
        subject.stub state: 'pending'
        subject.state_value.should == 1
      end
    end
  end

  describe '#to_date' do
    before { subject.stub_chain :scheduled_at, to_s: :date }

    it 'should format the game date' do
      subject.to_date.should == :date
    end
  end

  describe '#to_datetime' do
    before { subject.stub to_date: :date, to_time: :time }

    it 'should invoke the humanize methods for date and time' do
      subject.to_datetime.should == 'date time'
    end
  end

  describe '#to_time' do
    before { subject.should_receive(:to_date).with(:short_time).and_return 'Time' }

    it 'should format the game date' do
      subject.to_time.should == 'time'
    end
  end

  describe '#update_sort' do
    before { subject.stub state_value: 1 }

    it 'should update the default_sort value' do
      subject.should_receive(:update_column).with(:default_sort, 1)
      subject.update_sort
    end
  end

end
