require 'spec_helper'

describe Address do
    before(:each) do
      @valid_attributes = {
        :house_number => 1,
        :street => "Penny Lane",
        :city => "San Francisco",
        :state => "CA",
        :zip => "94132"
      }
    end
  describe "Association" do

    it "should respond to :people" do
      addr = Address.new
      addr.should respond_to(:people)
    end

    it "should allow creation of a person" do

      addr = Address.create!(@valid_attributes)

      lambda {      
        lambda {
          addr.people.create(:first_name => "Joe", :last_name => "Smith")
        }.should change(PeopleAddressesJoin, :count).by(1)
      }.should change(Person, :count).by(1)
    end

  end

  
end
