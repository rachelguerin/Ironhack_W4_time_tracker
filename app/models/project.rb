class Project < ActiveRecord::Base
	has_many :entries
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :name, length: {maximum: 30}
	validates :name, format: {with: /\w\s[^_]/} #alphanumeric & spaces
	#validates :name, format: {with: /[A-Za-z0-9\s]+/} #alphanumeric & spaces
	#validates :name, format: {with: /\A[A-Za-z0-9\s]+/} #alphanumeric & spaces
	
	# validates :description, presence: true


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

	def total_time_in_month(m,y)
		from_date = Date.new(y,m,1)
		to_date = from_date.end_of_month
		entries = self.entries.where(date: from_date..to_date) 
		hrs = entries.to_a.sum(&:hours)
		mins = entries.to_a.sum(&:minutes)
		{hours: ((hrs*60) + mins)/60, minutes: ((hrs*60) + mins)%60}
	end
end
