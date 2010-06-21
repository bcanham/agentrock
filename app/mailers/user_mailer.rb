class UserMailer < ActionMailer::Base
  def activation(user)
    setup_email(user)
    @subject += "Welcome #{user.username}, Please activate your new account"
    @body[:url] = "http://agentrock.net/activate/#{user.activation_code}"
  end
  
  def activated(user)
    setup_email(user)
    @subject += "Welcome #{user.username}, Your account has been activated!"
    @body[:url] = "http://agentrock.net/"
  end
  
  def reset_password(user)
    setup_email(user)
    @subject += "Hi #{user.username}, Your password reset instructions are here!"
    @body[:url] = "http://agentrock.net/password_reset/#{user.reset_token}"
  end
  
  protected
  
  def setup_email(user)
    @recipients = "#{user.email}"
    @from = "ADMINEMAIL"
    @subject = "[agentrock.net] "
    @sent_on = Time.now
    @body[:user] = user
  end  
end