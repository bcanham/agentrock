module AccountsHelper

	def account_details(current_user)
	  unless Account.first(:conditions => { :owner => current_user })
	  	link_to "You should fill in a few deatils about yourself", "/#{current_user}/details"
	  end
	end

end
