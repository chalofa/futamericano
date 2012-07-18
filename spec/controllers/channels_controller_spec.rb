require 'spec_helper'

describe ChannelsController do
  let(:week) { stub(Week) }

  describe 'GET :show' do
    before { controller.should_receive :find_current_week }

    context 'when a week is active' do
      before do
        controller.instance_variable_set(:@week, week)
        week.stub games_with_channels: :channels
        get :show
      end

      it 'should be successful' do
        response.should be_success
      end

      it 'should assign @channels' do
        assigns(:channels).should == :channels
      end
    end

    context 'when there is no week' do
      before do
        get :show
      end

      it 'should be successful' do
        response.should be_success
      end

      it 'should assign empty @channels' do
        assigns(:channels).should be_empty
      end
    end
  end

end
