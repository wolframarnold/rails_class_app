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
  # Note for the root URL /: We want to route it to the people controller's index action (parsing of incoming route)
  # but for generating of URL's, we don't want to generate a URL to / when given the people controller and index action.
  # Hence we only test the root URL one way (parsing), using the params_for rspec helper as opposed to the
  # should route_to construction
  it 'should route GET / to the people controller and index action' do
    params_from(:get, '/').should == { :controller => 'people', :action => 'index'}
  end
end
