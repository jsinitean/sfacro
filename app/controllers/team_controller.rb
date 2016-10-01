class TeamController < ApplicationController

  def index
  
  end

  def all
     @teams = SalesforceUser.active.ceo.sorted
     @team_size = @teams.size
     #@user = SalesforceUser.find(params[:user_id])
  end

  def heroku
 
  end

  def search
    @terms = TermList.search params[:search]
    @teams = SalesforceUser.active.ceo.sorted
    @team_size = @teams.size

  end

  def show
    @terms = TermList.find(params[:id])
    @teams = SalesforceUser.active.ceo.sorted
    @team_size = @teams.size
  end

end
