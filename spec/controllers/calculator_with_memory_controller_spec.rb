require 'spec_helper'

describe CalculatorController do
  describe "POST add" do
    it 'saves the result' do
      lambda {
        post :store, {:result => 5}
        assigns[:result].should == 5
      }.should change(Calculation,:count).by(1)
    end
    it 'render to results' do
      post :store, {:result => 5}
      response.should render_template('results')
    end
  end
end
