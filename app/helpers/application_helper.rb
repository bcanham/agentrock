module ApplicationHelper
	
	def login_logout
		unless logged_in?
			link_to("Login", "/login")
		else
			link_to("Logout","/logout")
		end
	end

	def user_public(current_user)
	   unless current_user.nil?
	  	link_to(current_user.username, "/#{current_user.username}")
# 	   else
# 	   	link_to("Anonymous", "/anonymous")
	   end
	end

end
