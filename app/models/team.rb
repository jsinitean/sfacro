class Team < ActiveRecord::Base
	scope :sorted, -> {
		order('teams.last_name ASC')
	}
end
