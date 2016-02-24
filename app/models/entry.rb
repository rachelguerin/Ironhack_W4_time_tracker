class Entry < ActiveRecord::Base
	belongs_to :project
	validates :hours, :minutes, numericality: {only_integer: true}
	validates :date, :hours, :minutes, presence: true
	validates :project, presence: true
	validates :project_exists?

	def get_string
		"#{self.hours} h - #{self.minutes} m - #{self.date.strftime(format='%F')}"
	end

	def project_exists?
		Project.find_by(id: self.project_id)
	end
end
