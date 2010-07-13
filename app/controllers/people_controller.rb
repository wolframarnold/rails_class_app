class PeopleController < ApplicationController

  before_filter :login_required

  verify :method => :post, :only => :create  # require a POST request for create action

  def index
    @people = Person.all

    respond_to do |format|
      format.html { render 'index'}
      format.xml { render :xml => @people }
      format.json { render :json => @people }
    end
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
