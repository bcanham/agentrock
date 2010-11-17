module AccountsHelper

	def edit_account_details(current_user)
	  unless Account.where(:owner => current_user).first
	  	link_to "You should fill in a few details about yourself", "/#{current_user}/edit"
	  end
	end

end
