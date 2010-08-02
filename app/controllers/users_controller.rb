class UsersController < Devise::RegistrationsController
	respond_to :html, :json#, :iphone
	before_filter :authenticate_user!, :only => [:index]
  
  def new		
  	super
  end
  
  def create
    super
    Account.create
  end
  
  def edit
    super
  end
  
  def update 
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
  
  def destroy
    @user = User.find(params[:id])    
    @user.delete

    respond_to do |format|
      format.html { redirect_to(root_url) }
      format.xml  { head :ok }
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
	  if [ 'index', 'edit', 'show' ].include? action_name	    
		  'users'
	  else
	    'application'
	  end
	end  
end
