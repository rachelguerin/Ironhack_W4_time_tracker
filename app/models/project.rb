class Project < ActiveRecord::Base

	def self.iron_find(parm)
		where(id: parm).first 
	end

	def self.clean_old
		where("created_at < ?",Time.now - 1.week).destroy_all
	end

	def self.last_created_projects(num)
		order(created_at: :desc).limit(num)
	end

	def name_with_description 
		self.name += self.description ? "- #{self.description}" : ""
	end
end
