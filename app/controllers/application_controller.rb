# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base		
# 	include SslRequirement

  helper :all # include all helpers, all the time
  #protect_from_forgery :only => [:create, :update, :destroy]
 	
  def koala_oauth
    Koala::Facebook::OAuth.new('141114879242972', 'edb74892f516289cab8c2b7643cf4bbd', user_omniauth_callback_url(:facebook))
  end
  
  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      edit_user_profile_url  
    elsif resource.is_a?(Admin)
      root_admin_url
    else  
    	super  
    end
  end
  
  def render_404
  	render :file => "#{Rails.root}/app/views/shared/404.html.erb",  :status => 404
	end
	
	def ensure_created_by!
	  Subdomain.first(:conditions => { :created_by => current_user })
	end
		
end
