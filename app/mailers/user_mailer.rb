class UserMailer < Devise::Mailer
  # include Resque::Mailer

  # default :from => "notifications@agentnate.com"

  def welcome(user)
    @subject = "Welcome #{user.first_name}, enjoy your Agent Rock account..."
    setup_email(user) do |format|
          format.html { render :layout => 'application' }
          format.text
    end
    # mail(:to => user.email, :subject => "Welcome #{user.name}, Please confirm your Agent Nate account")
  end

  def confirmation_instructions(user)
    @subject = "Welcome #{user.login}, Please confirm this email address..."
    setup_email(user) do |format|
          format.html { render :layout => 'application' }
          format.text
    end
  end

protected

  def setup_email(user)
    @recipients = "#{user.email}"
    @from = "<no-reply@agentrock.net>"
    @sent_on = Time.now
    @body[:user] = user
  end

end