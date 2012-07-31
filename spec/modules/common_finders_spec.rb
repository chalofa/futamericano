require 'spec_helper'

describe CommonFinders do
  class FooFinder
    include CommonFinders
  end
  let(:foo) { FooFinder.new }

  describe '.next_pending' do
    before do
      FooFinder.stub_chain(:pending, :first).and_return foo
    end

    it 'should find the first pending state' do
      FooFinder.next_pending.should == foo
    end
  end

end
