module ApplicationHelper

	def flash_message
		display_message(:alert) || display_message(:notice)
	end

	def show_time(project,date)
		total = project.total_time_in_month(date.month,date.year)
		"#{total[:hours]} hours #{total[:minutes]} minutes"
	end

	private

	def display_message(type)
		if flash[type]
			content_tag :div, class: "message #{type}" do
				content_tag :p do
					flash[type]
				end
			end
		end
	end

end
