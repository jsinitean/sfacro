class SalesforceUser < ActiveRecord::Base

	self.table_name = 'salesforce.user'

	scope :sorted, -> {
		order('salesforce.user.name ASC')
	}
end
