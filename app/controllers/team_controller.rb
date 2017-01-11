class TeamController < ApplicationController

  def index
  
  end

  def all
     @teams = SalesforceUser.active.ceo.sorted
     @team_size = @teams.size
     @events = SalesforceEvent.today.sorted
  end
  
  def download
    file = "#{Rails.root}/User_License_Comparison.pdf"
    if File.exists?(file)
      send_file file, :type=>"application/pdf", :x_sendfile=>true
    else
      flash[:notice] = 'File not found'
      redirect_to :index
    end
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
