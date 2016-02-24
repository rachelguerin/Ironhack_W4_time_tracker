class Project < ActiveRecord::Base
	has_many :entries

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

	def total_hours_in_month(m,y)
		from_date = Date.new(y,m,1)
		to_date = from_date.end_of_month
		entries = self.entries.where(date: from_date..to_date) 
		hrs = entries.to_a.sum(&:hours)
		mins = entries.to_a.sum(&:minutes)
		"#{((hrs*60) + mins)/60} hours #{((hrs*60) + mins)%60} minutes"
	end
end
