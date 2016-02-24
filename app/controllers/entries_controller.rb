class EntriesController < ApplicationController
	def index
		@project = Project.find_by(id: params[:project_id])
		@entries = @project.entries
		total_time_in_month = @project.total_time_in_month(Time.now.month,Time.now.year)
		@current_month_hours = total_time_in_month[:hours]
		@current_month_minutes = total_time_in_month[:minutes]
	end

	def new
		@project = Project.find_by(id: params[:project_id])
		@entry = @project.entries.new
	end

	def create

	end
end
