require 'spec_helper'

describe SoonController do
  let(:season) { stub(Season) }

  describe 'GET :show' do
    before do
      Season.stub next_pending: season
      get :show
    end

    it 'returns http success' do
      response.should be_success
    end

    it 'should assign the next season' do
      assigns[:season].should == season
    end
  end

end
