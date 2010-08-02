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
		if @account = Account.first(:conditions => { :owner => current_user.name })
    	redirect_to edit_account_details_path
    end
  end
  
  def new
    @account = Account.new
  end
  
  def create
    @account = Account.new(params[:account])
    
    if @account.save
    	redirect_to root_url
    end
  end
  
  def edit
    @account = Account.first(:conditions => { :owner => current_user.name })
  end
  
  def update
    
  end
  
layout :choose_layout

private
	def choose_layout    
	  if [ 'index', 'show', 'edit', 'show' ].include? action_name	    
		  if user_signed_in? 
		  	'users' 		  	
	  else
	    'application'
	    end	  	
	  end
	end   

end
