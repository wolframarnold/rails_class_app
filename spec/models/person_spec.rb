require 'spec_helper'

describe Person do
  it 'should respond_to :first_name and :last_name' do
    p = Person.new
    p.should respond_to(:first_name)
    p.should respond_to(:last_name)
  end
  
  it 'should construct a full name' do
    p = Person.new(:first_name => "Eve", :last_name => "Smith")
    p.full_name.should == "Eve Smith"
  end
  
  it 'should not be valid if last_name is missing' do
    p = Person.new(:first_name => "Eve")
    p.should_not be_valid
    p.errors[:last_name].should == "must be provided!"
  end

  it 'should not be valid if first_name is missing' do
    p = Person.new(:last_name => "Smith")
    p.should_not be_valid
    p.errors[:first_name].should == "must be provided!"
  end

  it 'should save a record when valid' do
    p = Person.new(:first_name => "Eve", :last_name => "Smith")
    p.should be_valid
    lambda {
      p.save
    }.should change(Person, :count).by(1)
  end

  it 'should not save a record when invalid' do
    p = Person.new(:last_name => "Smith")
    p.should_not be_valid
    lambda {
      p.save
    }.should_not change(Person, :count)
    p.errors[:first_name].should == "must be provided!"
  end

end
