class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.create(params[:person])
    if @person.new_record?
      # saving failed
      render 'new'
    else
      # saving successful
      redirect_to people_path  # retun to index
    end
  end

end
