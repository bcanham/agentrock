# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base		
	include UrlHelper
# 	include SslRequirement

  helper :all # include all helpers, all the time
  protect_from_forgery :only => [:create, :update, :destroy]
 	

  
  def render_404
  	render :file => "#{Rails.root}/app/views/shared/404.html.erb",  :status => 404
	end
	
	def ensure_created_by!
	  Subdomain.first(:conditions => { :created_by => current_user })
	end
		
end
