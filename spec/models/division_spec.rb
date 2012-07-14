require 'spec_helper'

describe Division do

  describe '#full_name' do
    before do
      subject.stub(conference: 'CONF', name: 'NAME')
    end

    it 'should return the division name with the conference' do
      subject.full_name.should == 'CONF NAME'
    end
  end

end



