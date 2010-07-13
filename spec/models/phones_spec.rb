require 'spec_helper'

describe Phone do

  it 'should respond to :person' do
    Phone.new.should respond_to(:person)
  end
end
