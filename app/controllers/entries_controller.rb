class EntriesController < ApplicationController
	def index
		@project = project
		@entries = @project.entries
		total_time_in_month = @project.total_time_in_month(Time.now.month,Time.now.year)
		@current_month_hours = total_time_in_month[:hours]
		@current_month_minutes = total_time_in_month[:minutes]
	end

	def new
		@project = project
		@entry = @project.entries.new
	end

	def create
		@project = project
		@entry = @project.entries.new entry_params
		if @entry.save
			redirect_to action: 'index', controller: 'entries', project_id: @project.id
		else 
			render "new"
		end
	
	end

	def destroy
		 @project = project
		 @entry = @project.entries.find_by(id: params[:id])
		 @entry.destroy
		 redirect_to action: 'index', controller: 'entries', project_id: @project.id
	end

	def edit
		@project = project
		@entry = @project.entries.find_by(id: params[:id])
	end

	def update
		@project = Project.find_by(id: params[:project_id])
		@entry = @project.entries.find_by(id: params[:id])
		if @entry.update_attributes entry_params
			redirect_to action: 'index', controller: 'entries', project_id: @project.id
		else 
			render "edit"
		end
	end

	def project
		@_project = Project.find_by(id: params[:project_id]) #to refactor later
	end

	private

	def entry_params
		params.require(:entry).permit(:hours, :minutes, :date)
	end
end
