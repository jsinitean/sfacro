class TeamController < ApplicationController

  def index
  
  end

  def all
  	 @teams = Team.sorted
  	 @team_size = @teams.size
     @salesforce_user = SalesforceUser.sorted
     #@user = SalesforceUser.find(params[:user_id])
  end

  def heroku
 
  end

  def search
    @terms = TermList.search params[:search]
    @teams = Team.sorted
    @team_size = @teams.size

  end

  def show
    @terms = TermList.find(params[:id])
    @teams = Team.sorted
    @team_size = @teams.size
  end

end
