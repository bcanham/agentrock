class AccountsController < ApplicationController
  respond_to :html, :json
  
  def index
 		@page_title = "Your Dashboard"
  	if user_signed_in?    	
    	@activity = Activity.all#(:conditions => { :posted_by => current_user.name })
    	#@count = @note.all.count
    	if @activity #= @note.all#only(:title, :id).paginate(:page => params[:page] || 1, :per_page => 10)
    		respond_with(@activity)
    	end	
  	else
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
