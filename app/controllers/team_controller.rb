class TeamController < ApplicationController

	def index
	end

  def all
  	 @teams = Team.sorted
  	 @team_size = @teams.size
  end

  def show
   
  end

end
