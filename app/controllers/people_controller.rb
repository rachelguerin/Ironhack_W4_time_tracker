class PeopleController < ApplicationController
	def new
		@person = Person.new
	end

	def create
		@person = Person.new person_params
		if @person.save
			#binding.pry
			@person.projects << Project.find_by(id: params["project"]["project_id"].to_i)
			flash[:notice] = 'Person created successfully'
			redirect_to action: 'new', controller: 'people'
		else
			flash[:alert] = 'Person not created'
			render "new"
		end
	end

	def person_params
		params.require(:person).permit(:name)
	end
end
