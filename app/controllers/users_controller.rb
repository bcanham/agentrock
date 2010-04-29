class UsersController < ApplicationController
	respond_to :html
  
  def index
		if user_signed_in?
			render :show	
		end
  end
  
  def show
    @user = User.find_by_email(params[:email]) 
    respond_with(@user)
  end

end
