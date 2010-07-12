require 'spec_helper'

describe PeopleAddressesJoin do

  before do
    @pa_join = PeopleAddressesJoin.new
  end

  it 'has a :person method' do
    @pa_join.should respond_to(:person)
  end
  
  it 'has an :address method' do
    @pa_join.should respond_to(:address)
  end

end
