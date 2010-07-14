class AccountsController < ApplicationController
  respond_to :html, :json
  
  def index
  	unless user_signed_in?  	
  		render 'users/new'
  	end
  end

  def show
  end
  
layout :choose_layout

private
	def choose_layout    
	  if [ 'index', 'show' ].include? action_name	    
		  if user_signed_in? 
		  'users' 
	  else
	    'application'
	  	end
	  end
	end   

end
