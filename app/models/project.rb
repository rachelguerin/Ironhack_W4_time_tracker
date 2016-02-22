class Project < ActiveRecord::Base

	def self.iron_find(parm)
		where(id: parm).first
	end

	def self.clean_old
		where("created_at < ?",Time.now - 1.week).destroy_all
	end
end
