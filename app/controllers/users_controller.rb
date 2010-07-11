class UsersController < Devise::RegistrationsController
	respond_to :html, :json
	before_filter :authenticate_user!, :only => [:index]
	ActionController::Base.session_options[:secure] = true
  
  def new
		super
  end
  
  def create
    super
  end
    
  def index
  end
  
  def show
    if @user = User.first(:conditions => { :name => params[:name]} )
	    respond_with(@user)   
	  else
	  	render_404
	  end  
  end
  
  def watch		
		unless @user = User.first(:conditions => {:watching => current_user.name})
			@user.watching = current_user.name
			if @user.save
				flash[:notice] = "Yeah bay-bay"
			else
				flash[:error] = "Not quite"
			end	
		end
		#respond_with("It Worked!")  	   
  end
  
  def unwatch
  	   
  end 

layout :choose_layout

private
	def choose_layout    
	  if [ 'edit', 'show' ].include? action_name	    
		  'users'
	  else
	    'application'
	  end
	end  
end
