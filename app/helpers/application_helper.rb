module ApplicationHelper
	
	def referer
	  return request.referer && request.user_agent
	end

end
