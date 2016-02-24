class Entry < ActiveRecord::Base
	belongs_to :project

	def get_string
		"#{self.hours} h - #{self.minutes} m - #{self.date.strftime(format='%F')}"
	end
end
