require 'spec_helper'

describe "/people/new" do
  before(:each) do
    assigns[:person] = Person.new  # will set @person in view
    render 'people/new'
  end

  it 'has the correct URL for form and method POST' do
    response.should have_tag("form[action=/people][method=post]")
  end

end
