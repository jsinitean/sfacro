class WelcomeController < ApplicationController
  def index

  end

  def search
    @terms = TermList.search params[:search]

  end

  def show
    @terms = TermList.find(params[:id])
  end


end
