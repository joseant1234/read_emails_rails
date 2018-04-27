module ApplicationHelper

	def color_card(email)
		return 'orange' if email.from != current_user.email
		return 'green'
	end

	def offset_col(email)
		return 'offset-s6' if email.from != current_user.email
	end

end
