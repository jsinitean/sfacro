class SalesforceEvent < ActiveRecord::Base

	self.table_name = 'salesforce.event'

	scope :today, -> {
		where('salesforce.event.enddatetime >= now()')
	}
	
	scope :sorted, -> {
		order('salesforce.event.startdatetime ASC')
	}

end
