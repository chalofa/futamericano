require 'spec_helper'

describe SoonController do
  let(:season) { stub(Season) }
  let(:game) { stub(Game) }

  describe 'GET :show' do
    before do
      Season.stub next_pending: season
      season.stub_chain(:weeks, :current, :games, :next_pending).and_return game
      get :show
    end

    it 'returns http success' do
      response.should be_success
    end

    it 'should assign the next season' do
      assigns[:season].should == season
    end

    it 'should assign the next game' do
      assigns[:game].should == game
    end
  end

end
