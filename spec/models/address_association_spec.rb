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

    it "should respond to :person" do
      addr = Address.new
      addr.should respond_to(:person)
    end

    it "should allow creation of a person" do

      addr = Address.create!(@valid_attributes)

      lambda {      
        addr.create_person(:first_name => "Joe", :last_name => "Smith")
      }.should change(Person, :count).by(1)
    end

  end

  
end
