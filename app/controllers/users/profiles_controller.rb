class Users::ProfilesController < ApplicationController


  # GET /users/profiles/1
  # GET /users/profiles/1.xml
  def show
    @user = User.where(:name => params[:name]).first
    @profile = @user.profile

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile }
    end
  end

  # GET /users/profiles/1/edit
  def edit
    @user = User.find(current_user.id)
    @profile = @user.build_profile
  end

  # PUT /users/profiles/1
  # PUT /users/profiles/1.xml
  def update
    @user = User.find(current_user.id)
    @profile = @user.profile
    
    if @profile = params[:profile]
      redirect_to user_profile_path(current_user.name)
    else
      redirect_to edit_user_profile_path
    end
  end

  # DELETE /users/profiles/1
  # DELETE /users/profiles/1.xml
  def destroy
    @users_profile = Users::Profile.find(params[:id])
    @users_profile.destroy

    respond_to do |format|
      format.html { redirect_to(users_profiles_url) }
      format.xml  { head :ok }
    end
  end
end
