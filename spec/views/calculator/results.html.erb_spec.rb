require 'spec_helper'

describe "/calculator/results" do
  before(:each) do
    assigns[:sum] = 0
    assigns[:results] = []
    render 'calculator/results'
  end

  it "has a form with action url /calculator/add" do
    response.should have_tag('form[action=/calculator/add]')
  end
end
