class TeamAddOn < ActiveRecord::Migration
  def change
  		add_column :teams, :yoda, :boolean
  		add_column :teams, :url, :string
  		add_column :teams, :team_on, :string
  end
end
