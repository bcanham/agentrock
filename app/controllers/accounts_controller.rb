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
		if @user = User.where(:name => params[:name]).first
	    respond_with(@user)   
      # @profile = @user.profile
      @photo = @user.image.url ? @user.image.url : 'logo.png'
	  else
	  	render_404
	  end

  end
  
  def new
    @account = Account.new
  end
  
  def create
    @account = Account.new(params[:account])
    @account.users.create!(params[:account][:user])
    if @account.save
    	respond_with(@account)
    	redirect_to root_url
    end
  end
  
  def edit
    @user = User.where(:name => current_user.name).first
    # @account = Account.where(:owner => @user).first
  end
  
  def update
    @user = User.where(:name => current_user.name).first
    @profile = @user.profile
    
    if @profile = params[:profile]
      redirect_to user_profile_path
    else
      redirect_to edit_user_profile_path
    end
  end
  
layout :choose_layout

private
	def choose_layout    
	  if user_signed_in? 
	  	'users' 		  	
    else
      'application'
    end	  	
	end   

end
