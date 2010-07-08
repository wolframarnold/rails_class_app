require 'spec_helper'

describe "People Routes" do
  it 'should route POST /people to the people controller and create action' do
    { :post => '/people' }.should route_to(:controller => 'people',
                                           :action     => 'create')
  end
  it 'should route GET /people to the people controller and index action' do
    { :get => '/people' }.should route_to(:controller => 'people',
                                          :action     => 'index')
  end
end
