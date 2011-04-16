class AccountsController < ApplicationController
  respond_to :html, :json, :xml, :js
  
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
		@user = User.find(current_user.id)
    # @account = Account.where(:owner => current_user.id).first
    # @photo = @account.image.url ? @account.image.url : 'logo.png'

  end
  
  def new
    @account = Account.new
  end
  
  def create
    @account = Account.new(params[:account])
    
    if @account.save
    	respond_with(@account)
    	redirect_to root_url
    end
  end
  
  def edit
    @account = Account.where(:owner => current_user.id).first
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
