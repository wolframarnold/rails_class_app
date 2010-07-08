class CalculatorController < ApplicationController

  def add
    @sum = 0
    o1 = params[:operand1].to_i
    o2 = params[:operand2].to_i
    @sum = o1 + o2
    load_results
    render 'results'
  end

  def store
    @result = params[:result].to_i
    Calculation.create(:result => @result)
    load_results
    render 'results'
  end

  def load_results
    @results = Calculation.find(:all)
  end
end
