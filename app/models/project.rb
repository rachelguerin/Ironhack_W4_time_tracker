class Project < ActiveRecord::Base

	def self.iron_find(parm)
		where(id: parm).first
	end
end
