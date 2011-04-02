Agentrock::Application.configure do
  # Settings specified here will take precedence over those in config/environment.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_view.debug_rjs             = true
  config.action_controller.perform_caching = false
	
	config.active_support.deprecation = :log
	
	config.session_store = { :domain => '.lvh.me:3001' }

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true
	config.action_mailer.default_url_options = { :host => 'lvh.me:3001' }

config.action_mailer.delivery_method = :remail
config.action_mailer.remail_settings = {
  :app_id  => "remail-agentrock",
  :api_key => "677aee17d4c2e015acf0754c909e7340a14101521b218291fa00906c2aa8f1db827565b2aebfa83d1fb5a2c08f1417bb50b111880fc98afa208cadd7e37915f7"
}
  # config.action_mailer.smtp_settings = {
  #     :tls => true,
  #     :address => "smtp.gmail.com",
  #     :port => "587",
  #     :domain => "agentrock.net",
  #     :authentication => :plain,
  #     :user_name => "agentrock.net@gmail.com",
  #     :password => "schi3$$way"
  #   }
end
