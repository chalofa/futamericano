require 'spec_helper'

describe SoonHelper do

  describe '#days_to_season_start' do
    let(:sep_1) { Time.zone.parse('2012/09/01 12:00 PM ET') }

    context 'when today is September 1st noon' do
      before do
        Time.zone.should_receive(:now).at_least(:once).and_return(sep_1)
      end

      it 'should return the days left until season opener (Sep/5)' do
        helper.days_to_season_start.should == 4
      end
    end
  end

end
