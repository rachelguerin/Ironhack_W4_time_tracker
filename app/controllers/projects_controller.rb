class ProjectsController < ApplicationController
	def index
		@projects = Project.last_created_projects(10) 

		if @projects.empty?  
			render template: 'site/no_projects'
		end
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

	def new

	end

	def destroy
		@project = Project.find_by(id: params[:id])
		@project.destroy
		redirect_to projects_path
	end

	def create
		project = Project.new(params[:project])
		if project.save
			redirect_to "projects/#{project.id}"
		else
			@errors = project.errors.full_messages
			render "new"		
		end
	end
end
