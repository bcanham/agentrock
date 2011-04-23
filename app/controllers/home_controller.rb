class HomeController < Devise::RegistrationsController

  def index
    if user_signed_in?
      # @note = Note.all(:conditions => { :listed_by => current_user.id })
      # @count = @note.all.count
      
      # if @notes = @note.only(:title, :id).paginate(:page => params[:page] || 1, :per_page => 10)      
      #   @notes
      # end
      
      render 'accounts/index'
    else
      build_resource
    end
  end  

end
