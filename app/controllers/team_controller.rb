class TeamController < ApplicationController

  def index
  
  end

  def all
     @teams = SalesforceUser.active.ceo.sorted
     @team_size = @teams.size
     @events = SalesforceEvent.today.sorted
  end

  def heroku
 
  end

  def search
    @terms = TermList.search params[:search]
    @teams = SalesforceUser.active.ceo.sorted
    @team_size = @teams.size
    @events = SalesforceEvent.today.sorted
  end

  def show
    @terms = TermList.find(params[:id])
    @teams = SalesforceUser.active.ceo.sorted
    @team_size = @teams.size
    @events = SalesforceEvent.today.sorted
  end

end
