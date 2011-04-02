class UsersController < Devise::RegistrationsController
	respond_to :html, :json#, :iphone
	#before_filter :authenticate_user!, :only => [:index]
  
  def new		
  	super
  end
  
  def create
    build_resource 
    @oauth = Koala::Facebook::OAuth.new('141114879242972', 'edb74892f516289cab8c2b7643cf4bbd', "http://rock.dev#{oauth_callback_new_path}/") 

    if resource.save!      
      if resource.active?        
        if resource.fb_opt_out == "yes"
          set_flash_message :notice, :signed_up
          sign_in(resource_name, resource)#_and_redirect(resource_name, resource)          
          redirect_to root_url
        else
          sign_in(resource_name, resource)
          redirect_to @oauth.url_for_oauth_code
        end        
      else
        set_flash_message :notice, :inactive_signed_up, :reason => resource.inactive_message.to_s
        expire_session_data_after_sign_in!
        redirect_to after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords(resource)
      render_with_scope :new
    end    
  end
  
  def edit
    super
  end
  
  def update 
    super
  end
    
  def index
  	@users = User.paginate(:page => params[:page] || 1, :per_page => 30)
  	@location = User.near(:position => [ 37.7, -122.4, 10 ])
  	@near_me = User.near(:position => [ current_user.lat, current_user.long, 10 ])
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

  def auth
      @oauth = Koala::Facebook::OAuth.new('141114879242972', 'edb74892f516289cab8c2b7643cf4bbd', "http://rock.dev#{oauth_callback_new_path}/") 
    code = @oauth.get_access_token(params[:code])
    @graph = Koala::Facebook::GraphAPI.new(code)
    data = @graph.get_object("me")
    # image = @graph.get_picture("me")

    if @user = User.find_for_facebook_oauth(data, current_user) 
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      # Resque.enqueue(ProcessFBProfilePicture, image)
      session["devise.facebook_data"] = code
      # sign_in(resource_name, resource)
      redirect_to root_url
    else
      session["devise.facebook_data"] = data
      redirect_to new_user_registration_url
    end
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
