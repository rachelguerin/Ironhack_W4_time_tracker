class ProjectsController < ApplicationController
	def index
		@projects = Project.last_created_projects(10)
	end

	def show
	#	@project = Project.find params[:id]
	#rescue ActiveRecord::RecordNotFound

		# unless @project = Project.find_by(id: params[:id])
		# 	render 'no_project_found'
		# end
		@project = Project.find_by(id: params[:id]) ||
			render_404(params)
	end
end
