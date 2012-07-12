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



# == Schema Information
#
# Table name: divisions
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     not null
#  conference :string(255)     not null
#  position   :integer(4)      not null
#  state      :string(255)     default("disabled"), not null
#  created_at :datetime
#  updated_at :datetime
#

