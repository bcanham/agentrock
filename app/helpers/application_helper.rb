module ApplicationHelper
	
	def login_logout
		unless user_signed_in?
			link_to("Login", "/login/")
		else
			link_to("Logout","/logout/")
		end
	end

	def user_public(current_user)
	  unless current_user.nil? 
	   unless current_user.name.nil?
	  	link_to(current_user.name, "/#{current_user.name}")
# 	   else
# 	   	link_to("Anonymous", "/anonymous/")
	   end
	  end 
	end
	
	def username(current_user)
	  unless current_user.nil? 
	   unless current_user.name.nil?
	  	current_user.name
	   end
	  end 
	end
	
	def user_settings_path(current_user)
	  unless current_user.nil?
	  	unless current_user.name.nil?
	  		link_to("Account", edit_user_path(current_user.name))
	  	end
	  end
	end
end
