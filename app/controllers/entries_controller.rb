class EntriesController < ApplicationController
	def index
		@project = Project.find_by(id: params[:project_id])
		@entries = @project.entries
	end
end
