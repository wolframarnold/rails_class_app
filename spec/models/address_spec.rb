require 'spec_helper'

describe Address do
  before(:each) do
    @valid_attributes = {
      :house_number => 1,
      :street => "Penny Lane",
      :city => "San Francisco",
      :state => "CA",
      :zip => "94132",
      :country => 'USA'
    }
  end

  describe "with valid attributes" do

    it "should create a new instance given valid attributes" do
      lambda {
        Address.create(@valid_attributes)
      }.should change(Address, :count).by(1)
    end

    it "Canadian zip with letters and numbers should be accepted" do
      @valid_attributes[:zip] = "1N5 C6R"
      @valid_attributes[:country] = "Canada"
      lambda {
        Address.create(@valid_attributes)
      }.should change(Address, :count).by(1)
    end

  end

  describe "with invalid attributes" do
    # let's pretend that house numbers like 1A don't exist
    # if you have time you can go back and change this to checking
    # if house_number starts with a number
    it "should require a house number to be a number" do
      invalid_attributes = @valid_attributes.merge(:house_number => "a")
      a = Address.new(invalid_attributes)
      a.should_not be_valid
    end

    it "should require a street" do
      invalid_attributes = @valid_attributes
      invalid_attributes.delete(:street)
      a = Address.new(invalid_attributes)
      a.should_not be_valid
    end

    it "should require a city" do
      invalid_attributes = @valid_attributes
      invalid_attributes.delete(:city)
      a = Address.new(invalid_attributes)
      a.should_not be_valid
    end

    it "should require the state to be no longer than two characters" do
      invalid_attributes = @valid_attributes.merge(:state => "test")
      a = Address.new(invalid_attributes)
      a.should_not be_valid
    end

    it "should require the state to be longer than one character" do
      invalid_attributes = @valid_attributes.merge(:state => "a")
      a = Address.new(invalid_attributes)
      a.should_not be_valid
    end

    describe "missing country" do
      # Extra credit: Flesh out these specs.  The implementation code to make these tests pass requires a Rails
      # feature we haven't covered yet.  Hint: Look up before_validation and read about ActiveRecord callbacks in
      # http://api.rubyonrails.org
      it "should default the country to USA if missing"
      it "should leave the country unchanged if it's given"
    end
  end

end
