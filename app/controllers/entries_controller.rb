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
		@project = Project.find_by(id: params[:project_id])
		@entry = @project.entries.new entry_params
		if @entry.save
			redirect_to action: 'index', controller: 'entries', project_id: @project.id
		else 
			render "new"
		end
	
	end

	private

	def entry_params
		params.require(:entry).permit(:hours, :minutes, :date)
	end
end
