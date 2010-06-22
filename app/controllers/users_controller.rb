class UsersController < ApplicationController
	respond_to :html
  
  def new
    unless logged_in?
    	@user = User.new
    else
    	render :index#, :layout => "dashboard"    	
    end	
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      self.current_user = @user
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def activate
    logout_keeping_session!
    user = User.find(:first, :conditions => {:activation_code => params[:activation_code]}) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.activate!
      self.current_user = user
      flash[:notice] = "Account Activated."
      redirect_to root_url
    when params[:activation_code].blank?
      flash[:error] = "The activation code was missing. Please follow the URL from your email."
      redirect_back_or_default('/')
    else
      flash[:error] = "We couldn't find a user with that activation code -- check your email? Or maybe you've already activated -- try signing in."
      redirect_back_or_default('/')
    end
  end
    
  def index
		
  end
  
  def show
    @user = User.first(:conditions => { :username => params[:username]} )
    respond_with(@user)   
  end
  
  def forgot_password
    # Just show a form with an email field.
  end
  
  def send_password_reset
    if @user = User.find(:first, :conditions => {:email => params[:email]})
      flash.now[:notice] = "Password reset instructions sent."
      @user.make_reset_token
      @user.send_password_reset_mail
    else
      flash.now[:error] = "Could not find a user with that email address."
      respond_to do |page|
        page.html { render :action => 'forgot_password' }
      end
    end
  end
  
  def reset_password
    if params[:reset_token].present?
      unless @user = User.find(:first, :conditions => {:reset_token => params[:reset_token]})
        flash[:error] = "Could not find a user with that passowrd reset token, Please follow the URL from your email."
        redirect_to root_url
      end
    else
      flash[:error] = "Could not find a user with that passowrd reset token, Please follow the URL from your email."
      redirect_to root_url
    end
  end
  
  def update_password
    logout_keeping_session!
    if @user = User.find(:first, :conditions => {:reset_token => params[:reset_token]})
      @user.password = params[:password]
      @user.password_confirmation = params[:password_confirmation]
      if @user.save
        @user.clear_reset_token
        flash[:notice] = "Your password was updated successfully, Please login using your new password"
        respond_to do |page|
          page.html { redirect_to login_url }
        end
      else
        respond_to do |page|
          page.html { render :action => 'reset_password' }
        end
      end
    end
  end  

layout :choose_layout

private
	def choose_layout    
	  if [ 'new', 'show' ].include? action_name	    
		  if logged_in?
		  	'users'
		  else
		  	'application'	
		  end  
	  else
	    'application'
	  end
	end  
end
